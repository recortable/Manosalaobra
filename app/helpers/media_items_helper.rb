module MediaItemsHelper
  def render_media(item)
    return if item.blank?
    output = if item.file.present?
               render_image_or_link(item.file, item)
             elsif item.url.present?
               render_image_or_link(item.url, item)
             elsif item.embed_code.present?
               item.embed_code
             else
               item.title
             end

    style = ""
    style += "width:#{item.width}px;" if item.width.present?
    style += "height:#{item.height}px;" if item.height.present?
    style += "display:block;margin:0 auto;" if item.position == 'center'
    style += "float:left;" if item.position == 'left'

    div_for(item, style: style) { output.html_safe }
  end

  protected
  def render_image_or_link(image_url, item)
    if image_url.to_s =~ /(png|jpg|gif)/i
      image_tag(image_url, alt: item.title)
    else
      link_to item.title, image_url.to_s
    end

  end
end