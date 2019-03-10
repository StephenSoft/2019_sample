class User < ApplicationRecord
  # 调用回调转化email格式s为小写
  before_save { self.email = email.downcase }
  # 定义邮箱验证正则常量
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #添加验证user.name user.email 不为空 设置最大长度
  validates :name,  presence: true, length: { maximum:50 }
  validates :email, presence: true, length: { maximum:255 },
                    format: { with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false }
  # 添加user.password_digest密码安全机制
  has_secure_password
  # 添加验证user.password最小长度
  validates :password, presence: true, length: { minimum:6 }

end
