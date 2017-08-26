class Admin::CompanyhonorsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :index]
  before_action :admin_required
  layout "admin"

  # ---CRUD---

  def index
    @companyhonors = Companyhonor.all.order("created_at DESC")
  end

  def show
    @companyhonor = Companyhonor.find(params[:id])

  end

  def new
    @companyhonor = Companyhonor.new
  end

  def create
    @companyhonor = Companyhonor.new(companyhonor_params)


    if @companyhonor.save
      redirect_to admin_companyhonors_path
    else
      render :new
    end
  end

  def edit
    @companyhonor = Companyhonor.find(params[:id])
  end

  def update
    @companyhonor = Companyhonor.find(params[:id])

    if @companyhonor.update(companyhonor_params)
      redirect_to admin_companyhonors_path
    else
      redirect_to :edit
    end
  end

  def destroy
    @companyhonor = Companyhonor.find(params[:id])
    @companyhonor.destroy
      redirect_to admin_companyhonors_path
  end





  # ---admin权限---

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "你没有管理员权限!"
    end
  end


  # ---private---

  def companyhonor_params
    params.require(:companyhonor).permit(:description)
  end

end
