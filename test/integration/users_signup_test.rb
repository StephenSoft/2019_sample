require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  # 测试登陆失败验证
  test 'invalid signup infirmation' do
    get signup_path
    assert_no_difference "User.count" do
      post users_path params: { user: { name: "", email: "aaaa@xxx", password: "123",
        password_infirmation: "111" } }
      assert_template 'users/new'
    end
  end

  #测试登陆成功
  test 'valid signup infirmation' do
    get signup_path
    assert_difference "User.count", 1 do
      post users_path params: { user: { name: "Example User", email: "user@example.com", password: "123456",
        password_infirmation: "123456" } }
      follow_redirect!
      assert_template 'users/show'
      assert is_logged_in?
    end
  end
end
