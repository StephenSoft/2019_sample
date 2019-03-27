module SessionsHelper

  #登陆用户
  def login(user)
    session[:user_id] = user.id
  end

  # 获取当前用户current_user
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id:session[:user_id])
    end
  end

  # 判断是否登陆
  def logged_in?
    !current_user.nil?
  end

  # 退出用户
  def logout
    session.delete(:user_id)
    @current_user.nil?
  end
end
