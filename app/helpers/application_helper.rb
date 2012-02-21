module ApplicationHelper
  def title(label, options = {})
    options.reverse_merge! tag: :h1
    content_for(:title) { label }
    content_tag(options[:tag], label)
  end

  def icon(symbol, label = '&nbsp')
    "<i class=\"icon-#{symbol}\"></i>#{label}".html_safe
  end

  def plural(count, singular, plural = nil)
    count == 1 ? singular : (plural || singular.pluralize)
  end
end
