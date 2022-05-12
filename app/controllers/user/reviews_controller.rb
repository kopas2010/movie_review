class User::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    review = Review.new(review_params)
    review.save
    redirect_to '/'
  end

  def index
  end

  def show
  end

  def edit
  end
  
  private
  def review_params
    params.require(:review).permit(:title, :body)
  end
end
