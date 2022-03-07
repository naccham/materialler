class Public::BookmarksController < ApplicationController

  def create
    @site = Site.find(params[:site_id])
    bookmark = current_user.bookmarks.new(site_id: @site.id)
    bookmark.save
    # redirect_to sites_path
  end

  def destroy
    @site = Site.find(params[:site_id])
    bookmark = current_user.bookmarks.find_by(site_id: @site.id)
    bookmark.destroy
    
    
    # if params[:mypage]
      # redirect_to user_path(current_user.id)
    # else
      # redirect_to sites_path
    # end
  end

end
