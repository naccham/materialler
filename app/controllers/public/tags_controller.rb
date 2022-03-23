class Public::TagsController < ApplicationController

  def show
    @thumbnail = "http://capture.heartrails.com/huge?"
    @tag = Tag.find(params[:id])
    @tag = @tag.sites.paginate(page: params[:page], per_page: 10)


  end

 def search
    if params[:title].present?
      @sites = Site.where('title LIKE ?', "%#{params[:title]}%")
    else
      @sites = Site.none
    end
 end
end
