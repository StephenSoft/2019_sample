# encoding: utf-8
module ApplicationHelper

  # 根据所在的页面返回title
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

end
