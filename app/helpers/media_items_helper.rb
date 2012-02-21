module MediaItemsHelper
  def render_media(item)
    output = if item.file.present?
      'file'
    elsif item.url.present?
      'url'
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
end