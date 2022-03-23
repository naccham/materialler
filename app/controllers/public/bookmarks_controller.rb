class Public::BookmarksController < ApplicationController

  def create
    @site = Site.find(params[:site_id])
    bookmark = current_user.bookmarks.new(site_id: @site.id)
    bookmark.save
    @site.bookmark_id = bookmark.id
    @site.save
  end

  def destroy
    @site = Site.find(params[:site_id])
    bookmark = current_user.bookmarks.find_by(site_id: @site.id)
    bookmark.destroy
  end

end
