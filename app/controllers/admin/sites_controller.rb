class Admin::SitesController < ApplicationController

  def index
    @site = Site.new
    @sites = Site.all
    @tags = Tag.all
    @posts = params[:tag_id].present? ? Site.find(params[:tag_id]).tags : Site.all
  end

  def create
    if @site = Site.create(site_params)
    end
    redirect_to admin_sites_path
  end

  def show
    @site = Site.find(params[:id])
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
    end
    redirect_to admin_sites_path
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to admin_sites_path
  end



  private

  def site_params
    params.require(:site).permit(:title, :introduce, :url, :thumbnail, tag_ids: [])
  end
end
