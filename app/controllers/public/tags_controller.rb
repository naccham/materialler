class Public::TagsController < ApplicationController

  def show
    @thumbnail = "http://capture.heartrails.com/huge?"
    @site = Tag.find(params[:id])
    @site = @site.sites.paginate(page: params[:page], per_page: 10)
    
    @tag = Tag.find(params[:id])

    @bookmark_ranks = Site.find(Bookmark.group(:site_id).order('count(site_id) desc').limit(10).pluck(:site_id))
    @bookmark_ranks_w = Site.find(Bookmark.group(:site_id).order('count(site_id) desc').limit(10).pluck(:site_id))
  end

 def search
    if params[:title].present?
      @sites = Site.where('title LIKE ?', "%#{params[:title]}%")
    else
      @sites = Site.none
    end
 end
end
