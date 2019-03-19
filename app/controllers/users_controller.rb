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
      #TODO
    else
      p "1111111111111"
      render 'new'
    end
    # render 'show'
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :passowrd,
        :passoword_confirmation)
    end
end
