class Public::SitesController < ApplicationController

  def index
    @sites = Site.all
  end

  def search
    if params[:title].present?
      @sites = Site.where('title LIKE ?', "%#{params[:title]}%")
    else
      @sites = Site.none
    end
  end
  
  def create
    site = Site.find(params[:site_id])
    bookmark = current_user.bookmarks.new(site_id: site.id)
    bookmark.save
    redirect_to user_path(current_user.id)
  end

  def destroy
    site = Site.find(params[:site_id])
    bookmark = current_user.bookmarks.find_by(site_id: site.id)
    bookmark.destroy
    redirect_to user_path(current_user.id)
  end

end
