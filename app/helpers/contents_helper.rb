module ContentsHelper
  def render_body(content)
    markdown.render(content.body).html_safe
  end


  def markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                          hard_wrap: true, autolink: true,
                                          fenced_code_blocks: true)

  end
end
