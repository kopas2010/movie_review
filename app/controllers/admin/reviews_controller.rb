class Admin::ReviewsController < ApplicationController
  def index
    @reviews = Review.page(params[:page]).per(10)
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to admin_reviews_path
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to admin_reviews_path
  end

  private
  def review_params
    params.require(:review).permit(:title, :body)
  end
end
