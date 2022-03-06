class Public::SitesController < ApplicationController

  def index
    @sites = Site.all
    @site_image = "http://capture.heartrails.com/170x100/shorten?"
  end
  
  def show
    @site = Site.find(params[:id])
    @site_image = "http://capture.heartrails.com/170x100/shorten?"
    @post_comment = PostComment.new
  end

  def search
    if params[:title].present?
      @sites = Site.where('title LIKE ?', "%#{params[:title]}%")
    else
      @sites = Site.none
    end
  end

end
