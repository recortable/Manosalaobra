module ContentsHelper
  # Localize attribute of content
  def loc(content, attribute)
    content.localized(attribute, current_locale)
  end

  def render_body(content)
    body = loc(content, :body)
    rendered = if body.blank?
                 ''
               elsif content.content_type == 'markdown'
                 text = process_media_items(body)
                 markdown.render(text).html_safe
               else
                 body
               end
    content_tag(:div, rendered, class: "body #{content.content_type}")
  end

  def process_media_items(text)
    text.gsub /!!@(\d+)/ do
      media = MediaItem.find_by_id($1)
      media.present? ? render_media(media) : "[Multimedia no encontrado: !!@#{$1}]"
    end
  end


  def markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                          hard_wrap: true, autolink: true,
                                          fenced_code_blocks: true)

  end
end
