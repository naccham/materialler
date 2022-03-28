class Public::SitesController < ApplicationController

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
