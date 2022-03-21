class Public::SitesController < ApplicationController

  def index
    @thumbnail = "http://capture.heartrails.com/large?"
    @sites = Site.paginate(page: params[:page], per_page: 10)
    @bookmark_ranks = Site.find(Bookmark.group(:site_id).order('count(site_id) desc').limit(3).pluck(:site_id))
  end

  def show
    @thumbnail = "http://capture.heartrails.com/huge?"
    @site = Site.find(params[:id])
    @comment = Comment.new
  end

  def search
    @sites = Site.search(params[:title])
  end

end
