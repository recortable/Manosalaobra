module ApplicationHelper
  def title(label, options = {})
    options.reverse_merge! tag: :h1
    content_for(:title) { label }
    content_tag(options[:tag], label)
  end

  def icon(symbol, label = '&nbsp')
    "<i class=\"icon-#{symbol}\"></i>#{label}".html_safe
  end
end
