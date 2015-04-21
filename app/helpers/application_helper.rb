module ApplicationHelper
  def fix_url(string)
    string.starts_with?("http://") ? string : "http://#{string}"
  end

  def format_date(date)
    date.strftime('%m/%d/%Y %l:%M%P %Z')
  end
end
