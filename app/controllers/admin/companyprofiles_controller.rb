class Admin::CompanyprofilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :index]
  before_action :admin_required
  layout "admin"

  # ---CRUD---

  def index
    @companyprofiles = Companyprofile.all.order("created_at DESC")
  end

  def show
    @companyprofile = Companyprofile.find(params[:id])

  end

  def new
    @companyprofile = Companyprofile.new
  end

  def create
    @companyprofile = Companyprofile.new(companyprofile_params)
    # @activity.user = current_user

    if @companyprofile.save
      redirect_to admin_companyprofiles_path
    else
      render :new
    end
  end

  def edit
    @companyprofile = Companyprofile.find(params[:id])
  end

  def update
    @companyprofile = Companyprofile.find(params[:id])

    if @companyprofile.update(companyprofile_params)
      redirect_to admin_companyprofiles_path
    else
      redirect_to :edit
    end
  end

  def destroy
    @companyprofile = Companyprofile.find(params[:id])
    @companyprofile.destroy
      redirect_to admin_companyprofiles_path
  end





  # ---admin权限---

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "你没有管理员权限!"
    end
  end


  # ---private---

  def companyprofile_params
    params.require(:companyprofile).permit(:title, :description)
  end

end
