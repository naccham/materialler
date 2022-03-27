class Admin::SitesController < ApplicationController

  before_action :authenticate_admin!

  def index
    @thumbnail = "http://capture.heartrails.com/170x100/shorten?"
    @site = Site.new
    @sites = Site.all.order(id: "DESC")
    @posts = params[:tag_id].present? ? Site.find(params[:tag_id]).tags : Site.all
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to admin_sites_path
    else
      @thumbnail = "http://capture.heartrails.com/170x100/shorten?"
      @posts = params[:tag_id].present? ? Site.find(params[:tag_id]).tags : Site.all
      @sites = Site.all.order(id: "DESC")
      render :index
    end
  end

  def show
    @thumbnail = "http://capture.heartrails.com/huge?"
    @site = Site.find(params[:id])
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    @site.update(site_params)
    redirect_to admin_sites_path
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to admin_sites_path
  end


  private

  def site_params
    params.require(:site).permit(:title, :introduce, :url, :commercial_use, :credit_notation, tag_ids: [])
  end
end
