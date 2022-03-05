class Public::SitesController < ApplicationController

  def index
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
