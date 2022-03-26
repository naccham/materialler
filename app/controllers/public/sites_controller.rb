class Public::SitesController < ApplicationController

  def index
    @thumbnail = "http://capture.heartrails.com/huge?"
    @sites = Site.paginate(page: params[:page], per_page: 10)
    @bookmark_ranks = Site.find(Bookmark.group(:site_id).order('count(site_id) desc').limit(10).pluck(:site_id))
  end

  def show
    @thumbnail = "http://capture.heartrails.com/huge?"
    @site = Site.find(params[:id])
    @comment = Comment.new
  end

  def search
    @thumbnail = "http://capture.heartrails.com/huge?"
    @sites = Site.search(params[:title])
    @sites = @sites.paginate(page: params[:page], per_page: 10)
  end

end
