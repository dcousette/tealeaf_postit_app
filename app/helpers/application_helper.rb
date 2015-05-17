module ApplicationHelper
  def fix_url(string)
    string.starts_with?("http://") ? string : "http://#{string}"
  end

  def format_date(date)
    if logged_in? and !current_user.time_zone.blank? 
      date = date.in_time_zone(current_user.time_zone)
    end
    date.strftime('%m/%d/%Y %l:%M%P %Z')
  end
end
