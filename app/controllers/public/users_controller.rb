class Public::UsersController < ApplicationController

  before_action :authenticate_user!,only: [:show, :edit]

  def show
    @thumbnail = "http://capture.heartrails.com/huge?"
    # まずログイン中のユーザに該当するブックマークのidのみを配列で定義
    bookmark_ids = Bookmark.where(user_id: current_user.id).pluck(:id)
    # ブックマークのIDを元にサイトの検索をかける
    @sites = Site.where(bookmark_id: bookmark_ids).paginate(page: params[:page], per_page: 10)
    @user = User.find(params[:id])
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
