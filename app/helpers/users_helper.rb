module UsersHelper

  def gravatar_for(user)
    # 获取user.email MD5值
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    # 根据gravatar_id获取gravatar_url
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

end
#"https://secure.gravatar.com/avatar/