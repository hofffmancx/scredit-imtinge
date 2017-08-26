class ActivitiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :join, :quit]
  layout "account", only: [:new]


  # ---CRUD---

  def index
    @activities = Activity.where(:is_hidden => false).order("created_at DESC")

        if Article.count <10
          @articles = Article.all.order("created_at DESC")
        else
          @articles = Article.all.order("created_at DESC").limit(10)
        end
  end

  def show
    @activity = Activity.find(params[:id])
    @user = @activity.user


    if Activity.count <3
      @activities = Activity.where(:is_hidden => false).order("created_at DESC")
    else
      @activities = Activity.where(:is_hidden => false).order("created_at DESC").limit(3)
    end

    if Project.count <10
      @projects = Project.all.order("created_at DESC")
    else
      @projects = Project.all.order("created_at DESC").limit(10)
    end


    if Article.count <10
      @articles = Article.all.order("created_at DESC")
    else
      @articles = Article.all.order("created_at DESC").limit(10)
    end

    if Product.count <10
      @products = Product.all.order("created_at DESC")
    else
      @products = Product.all.order("created_at DESC").limit(10)
    end


    @useractivities = @activity.user.activities.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    @activity_reviews = ActivityReview.where(activity_id: @activity.id).order("created_at DESC")
    @activity_review = ActivityReview.new
    @activity_hots = Activity.where(:is_hidden => false).sort_by{|activity| -activity.activity_reviews.count}    #重要功能写法，按数据要求排序

    if @activity.is_hidden
      flash[:warning] = "这篇文章在审核中！不可查看！"
      redirect_to root_path
    end
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user

    if @activity.save
      redirect_to account_activity_collections_path
      flash[:notice] = "文章已提交，待管理员审核后可发布"
    else
      render :new
    end
  end


  # ---article_collection 收藏文章---

  def join
    @activity = Activity.find(params[:id])

    if !current_user.is_activity_member_of?(@activity)
      current_user.join_activity_collection!(@activity)
    end
      redirect_to activity_path(@activity)
  end

  def quit
    @activity = Activity.find(params[:id])

    if current_user.is_activity_member_of?(@activity)
      current_user.quit_activity_collection!(@activity)
    end
      redirect_to activity_path(@activity)
  end


  # ---private---

  private

  def activity_params
    params.require(:activity).permit(:image, :title, :description, :summary, :user_id)
  end
end
