module ApplicationHelper
  def create_flash(type, message)
    type = 'info' if ['alert', 'notice'].include? type 
    content_tag(:div, message, class: "alert alert-#{type}", role: "alert")
  end
end
