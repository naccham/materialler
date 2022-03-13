class Public::TagsController < ApplicationController
  def index
    @tags = Tag.all
  end
  
  def show
    @thumbnail = "http://capture.heartrails.com/170x100/shorten?"
    @tag = Tag.find(params[:id])
    @sites = Site.all
  end
  
 def search
    if params[:title].present?
      @sites = Site.where('title LIKE ?', "%#{params[:title]}%")
    else
      @sites = Site.none
    end
  end
end
