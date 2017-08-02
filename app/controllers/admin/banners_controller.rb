class Admin::BannersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update,:index]

  layout "admin"

  def index
    @banners = Banner.all
  end

  def edit
    @banner = Banner.find(params[:id])
  end

  def update
    @banner = Banner.find(params[:id])
    if @banner.update(banner_params)
      redirect_to admin_banners_path
    else
      render :edit
    end
  end

  private

  def banner_params
    params.require(:banner).permit(:title,:pic)
  end

end
