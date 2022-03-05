class Public::TagsController < ApplicationController
  def index
    @tags = Tag.all
  end
  
  def show
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
