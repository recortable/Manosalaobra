module ContentsHelper
  def render_body(content)
    rendered = if content.body.blank?
      ''
    elsif content.content_type == 'markdown'
      markdown.render(content.body).html_safe
    else
      content.body
    end
    content_tag(:div, rendered, class: "body #{content.content_type}")
  end


  def markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                          hard_wrap: true, autolink: true,
                                          fenced_code_blocks: true)

  end
end
