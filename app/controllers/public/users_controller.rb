class Public::UsersController < ApplicationController
  
  before_action :authenticate_user!,only: [:show, :edit]
  
  def show
    @thumbnail = "http://capture.heartrails.com/170x100/shorten?"
    @bookmarks = current_user.bookmarks
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end
  
  def confirm
  end
  
  def withdrawal
    @user = current_user
    @user.update(active: false)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
