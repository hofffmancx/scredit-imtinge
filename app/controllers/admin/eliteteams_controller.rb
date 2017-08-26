class Admin::EliteteamsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :index]
  before_action :admin_required
  layout "admin"

  # ---CRUD---

  def index
    @eliteteams = Eliteteam.all.order("created_at DESC")
  end

  def show
    @eliteteam = Eliteteam.find(params[:id])

  end

  def new
    @eliteteam = Eliteteam.new
  end

  def create
    @eliteteam = Eliteteam.new(eliteteam_params)


    if @eliteteam.save
      redirect_to admin_eliteteams_path
    else
      render :new
    end
  end

  def edit
    @eliteteam = Eliteteam.find(params[:id])
  end

  def update
    @eliteteam = Eliteteam.find(params[:id])

    if @eliteteam.update(eliteteam_params)
      redirect_to admin_eliteteams_path
    else
      redirect_to :edit
    end
  end

  def destroy
    @eliteteam = Eliteteam.find(params[:id])
    @eliteteam.destroy
      redirect_to admin_eliteteams_path
  end





  # ---admin权限---

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "你没有管理员权限!"
    end
  end


  # ---private---

  def eliteteam_params
    params.require(:eliteteam).permit(:description)
  end

end
