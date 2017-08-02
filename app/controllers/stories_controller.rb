class StoriesController < ApplicationController
  def show
    @story = Story.find(params[:id])
    @activities = Activity.all
    @articles = Article.all
    @products = Product.all
    @user = @story.user


    if @story.is_hidden
      flash[:warning] = "这篇文章在审核中！不可查看！"
      redirect_to root_path
    end
  end
end
