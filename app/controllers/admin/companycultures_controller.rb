class Admin::CompanyculturesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :index]
  before_action :admin_required
  layout "admin"

  # ---CRUD---

  def index
    @companycultures = Companyculture.all.order("created_at DESC")
  end

  def show
    @companyculture = Companyculture.find(params[:id])

  end

  def new
    @companyculture = Companyculture.new
  end

  def create
    @companyculture = Companyculture.new(companyculture_params)


    if @companyculture.save
      redirect_to admin_companycultures_path
    else
      render :new
    end
  end

  def edit
    @companyculture = Companyculturer.find(params[:id])
  end

  def update
    @companyculture = Companyculture.find(params[:id])

    if @companyculture.update(companyculture_params)
      redirect_to admin_companycultures_path
    else
      redirect_to :edit
    end
  end

  def destroy
    @companyculture = Companyculture.find(params[:id])
    @companyculture.destroy
      redirect_to admin_companycultures_path
  end





  # ---admin权限---

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "你没有管理员权限!"
    end
  end


  # ---private---

  def companyculture_params
    params.require(:companyculture).permit(:description)
  end

end
