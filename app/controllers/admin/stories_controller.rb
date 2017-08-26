class Admin::StoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :index]
  before_action :admin_required
  layout "admin"

  # ---CRUD---

  def index
    @stories = Story.all.order("created_at DESC")
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
    @story_categories = Product.all.map { |c| [c.title, c.id] }
  end

  def create
    @story = Story.new(story_params)
    @story.user = current_user
    @story.product_id = params[:product_id]

    if @story.save
      redirect_to admin_stories_path
    else
      render :new
    end
  end

  def edit
    @story = Story.find(params[:id])
    @story_categories = Product.all.map { |c| [c.title, c.id] }
  end

  def update
    @story= Story.find(params[:id])
    @story.product_id = params[:product_id]
    if @story.update(story_params)
      redirect_to admin_stories_path
    else
      redirect_to :edit
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
      redirect_to admin_stories_path
  end


  # ---后台排序按钮功能---

  def move_up
    @story = Story.find(params[:id])
    @story.move_higher
    redirect_to :back
  end

  def move_down
    @story = Story.find(params[:id])
    @story.move_lower
    redirect_to :back
  end


  # ---后台隐藏或公开按钮---

  def publish
    @story = Story.find(params[:id])
    @story.publish!
    redirect_to :back
  end

  def hide
    @story = Story.find(params[:id])
    @story.hide!
    redirect_to :back
  end


  # ---admin权限---

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "你没有管理员权限!"
    end
  end


  # ---private---

  def story_params
    params.require(:story).permit(:image, :title, :description,:summary, :user_id, :is_hidden,:product_id)
  end
end
