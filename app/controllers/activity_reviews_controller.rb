class ActivityReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity

  def new
    @activity_review = ActivityReview.new
  end

  def create
    @activity_review = ActivityReview.new(activity_review_params)
    @activity_review.user_id = current_user.id
    @activity_review.activity_id = @activity.id

    if @activity_review.save
      redirect_to @activity
    else
      flash[:warning] = "你的评论没填写内容耶！"
      redirect_to @activity
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def activity_review_params
    params.require(:activity_review).permit(:comment, :user_id, :activity_id)
  end
end
