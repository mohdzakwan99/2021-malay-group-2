class ReviewsController < ApplicationController

  def new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      flash[:success] = t(:review_created)
      redirect_back(fallback_location: @user)
    else
      flash[:danger] = t(:review_failed)
      redirect_back(fallback_location: @user)
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      flash[:success] =  t(:review_updated)
      redirect_to courses_path
    else
      flash[:danger] = t(:review_not_updated)
      redirect_back(fallback_location: @user)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:success] = t(:review_deleted)
    redirect_back(fallback_location: @user)
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :course_id, :content)
  end
end
