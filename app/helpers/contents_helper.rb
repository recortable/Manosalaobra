module ContentsHelper
  def render_body(content)
    if content.body.blank?
      ''
    elsif content.content_type == 'markdown'
      markdown.render(content.body).html_safe
    else
      content.body
    end
  end


  def markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                          hard_wrap: true, autolink: true,
                                          fenced_code_blocks: true)

  end
end
