class Admin::CountryCategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :index]
  # before_action :admin_required
  layout "admin"

  def index
    @country_categories = CountryCategory.all
  end

def new
    @country_category = CountryCategory.new
end

def create
    @country_category = CountryCategory.new(category_params)
  if @country_category.save
    redirect_to admin_country_categories_path
  else
    render :new
  end
end

def edit
    @country_category = CountryCategory.find(params[:id])
end

def update
    @country_category = CountryCategory.find(params[:id])
  if @country_category.update(category_params)
    redirect_to admin_country_categories_path
  else
    render :edit
  end
end

def destroy
    @country_category = CountryCategory.find(params[:id])
    @country_category.destroy
    redirect_to admin_country_categories_path
end

private

def category_params
    params.require(:country_category).permit(:title)
end
end
