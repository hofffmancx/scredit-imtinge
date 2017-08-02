class StoriesController < ApplicationController
  def show
    @story = Story.find(params[:id])
    @user = @story.user

    if Project.count <10
      @projects = Project.all.order("created_at DESC")
    else
      @projects = Project.all.order("created_at DESC").limit(10)
    end

    if Activity.count <10
      @activities = Activity.all.order("created_at DESC")
    else
      @activities = Activity.all.order("created_at DESC").limit(10)
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



    if @story.is_hidden
      flash[:warning] = "这篇文章在审核中！不可查看！"
      redirect_to root_path
    end
  end
end
