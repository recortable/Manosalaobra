module ProposedNamesHelper

  def end_of_voting_in_days
    today = Date.today
    ends = Date.new(2012, 3, 17)
    ends.mjd - today.mjd
  end

  MAX_LENGTH = 18
  def divide_name(name, max_length = MAX_LENGTH)
    name.length > max_length ? divide(name) : name
  end

  private
  def divide(string)
    "#{h(string.slice(0, string.length/2))} <br /> #{h(string.slice(string.length/2, string.length))}".html_safe
  end

end
