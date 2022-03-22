class Public::TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @thumbnail = "http://capture.heartrails.com/large?"
    @tag = Tag.find(params[:id])
    @tag.sites = Site.paginate(page: params[:page], per_page: 10)
    @tag_one = @tag.sites

  end

 def search
    if params[:title].present?
      @sites = Site.where('title LIKE ?', "%#{params[:title]}%")
    else
      @sites = Site.none
    end
  end
end
