class Public::UsersController < ApplicationController
  def show
    @bookmarks = Bookmark.all
    @bookmarks = current_user.bookmarks
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
