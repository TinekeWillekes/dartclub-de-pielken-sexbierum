module ApplicationHelper
  def back_to(path)
    link_to("&laquo; Back".html_safe, path)  
  end
end
