#encoding:utf-8
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # debugger
  end
#   <aside class="col-md-4">
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      flash[:success] = "Welcome to the Sample APP ! "
      redirect_to @user
    else
      render 'new'
    end
  end

  private
    # 使用strong parameters
    def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
