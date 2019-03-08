#encoding:utf-8
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name:"Example User", email:"user@example.com")
  end

  # 测试user是否有效
  test "should be valid" do
    assert @user.valid?
  end

  # 测试user.name 是否为空
  test "name should be persent" do
    @user.name = "   "
    assert_not @user.valid?
  end

  # 测试user.email 是否为空
  test "email should be persent" do
    @user.email = "   "
    assert_not @user.valid?
  end

  # 测试user.name 最大长度
  test "name should not be to long" do
    @user.name = "a"*51
    assert_not @user.valid?
  end

  # 测试user.email 最大长度
  test "eamil should not be to long" do
    @user.email = "e"*244 + "@example.com"
    assert_not @user.valid?
  end

  # 测试user.email是否为有效邮箱地址并指出无效地址
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com User@FOO.COM AAA_AS@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid"
    end
  end

  # 测试user.email是否为有效邮箱地址并指出无效地址
  test "email validation should reject addresses" do
    valid_addresses = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]
    valid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{address.inspect} should be invalid"
    end
  end

  # 测试user.email是否唯一
  test "email addresses shoul be unqiue" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

end
