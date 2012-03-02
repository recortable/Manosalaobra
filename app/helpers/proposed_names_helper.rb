module ProposedNamesHelper

  def process_name(name)
    max_length = 15
    name.length > max_length ? divide(name) : name
  end

  private

  def divide(string)
    "#{h(string.slice(0, string.length/2))} <br /> #{h(string.slice(string.length/2, string.length))}".html_safe
  end

end
