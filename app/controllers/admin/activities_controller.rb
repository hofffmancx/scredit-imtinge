class Admin::ActivitiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :index]
  before_action :admin_required
  layout "admin"

  # ---CRUD---

  def index
    @activities = Activity.all.order("created_at DESC")
  end

  def show
    @activity = Activity.find(params[:id])

  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user

    if @activity.save
      redirect_to admin_activities_path
    else
      render :new
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity= Activity.find(params[:id])

    if @activity.update(activity_params)
      redirect_to admin_activities_path
    else
      redirect_to :edit
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
      redirect_to admin_activities_path
  end


  # ---后台排序按钮功能---

  def move_up
    @activity = Activity.find(params[:id])
    @activity.move_higher
    redirect_to :back
  end

  def move_down
    @activity = Activity.find(params[:id])
    @activity.move_lower
    redirect_to :back
  end


  # ---后台隐藏或公开按钮---

  def publish
    @activity = Activity.find(params[:id])
    @activity.publish!
    redirect_to :back
  end

  def hide
    @activity = Activity.find(params[:id])
    @activity.hide!
    redirect_to :back
  end


  # ---admin权限---

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "你没有管理员权限!"
    end
  end


  # ---private---

  def activity_params
    params.require(:activity).permit(:image, :title, :description,:summary, :user_id, :is_hidden)
  end
end
