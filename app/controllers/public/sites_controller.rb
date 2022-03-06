class Public::SitesController < ApplicationController

  def index
    @thumbnail = "http://capture.heartrails.com/170x100/shorten?"
    @sites = Site.all
  end
  
  def show
    @thumbnail = "http://capture.heartrails.com/170x100/shorten?"
    @site = Site.find(params[:id])
    @comment = Comment.new
  end

  def search
    if params[:title].present?
      @sites = Site.where('title LIKE ?', "%#{params[:title]}%")
    else
      @sites = Site.none
    end
  end

end
