class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email:params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login(user)
      Rails.logger.info(session[:user_id])
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination' # 不完全正确”
      render 'new'
      #redirect_to signup_path 重定向发起新的post请求
    end
  end

  def destroy

  end

end
