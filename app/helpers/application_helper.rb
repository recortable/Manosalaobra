module ApplicationHelper
  def title(label, options = {})
    options.reverse_merge! tag: :h1
    content_for(:title) { label }
    content_tag(options[:tag], label)
  end

  def icon(symbol, label = '&nbsp')
    label = I18n.t("actions.#{label}") if label.is_a? Symbol
    "<i class=\"icon-#{symbol.to_s.gsub(/_/, '-')}\"></i> #{label}".html_safe
  end

  def plural(count, singular, plural = nil)
    count == 1 ? singular : (plural || singular.pluralize)
  end

  # TC: translate_collection
  # Prepare a collection for a select input box
  def tc(prefix, collection)
    collection.map {|i| [t("#{prefix}.#{i}"), i]}
  end
end
