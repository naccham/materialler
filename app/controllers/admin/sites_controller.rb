class Admin::SitesController < ApplicationController

  def index
    @site = Site.new
    @sites = Site.all
  end

  def create
    @site = Site.new(site_params)
    @site.save
    redirect_to admin_sites_path
  end

  def show
    @site = Site.find(params[:id])
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    site = List.find(params[:id])
    site.update(site_params)
    redirect_to admin_sites_path
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to admin_sites_path
  end

  private

  def site_params
    params.require(:site).permit(:title, :introduce)
  end
end