require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  # 添加title去重方法
  def setup
    @base_title = " | Ruby on Rails Tutorial Sample App"
  end

  test "should get root" do
    get static_pages_home_url #FILL_IN
    assert_response :success  #FILL_IN 使用FILL_IN测试无法通过 根路由即为home方法路由 
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home#{@base_title}"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help#{@base_title}"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About#{@base_title}"
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "Contact#{@base_title}"
  end

end
