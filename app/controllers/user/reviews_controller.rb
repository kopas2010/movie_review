class User::ReviewsController < ApplicationController

  def create
    movie = Movie.find(params[:movie_id])
    review = Review.new(review_params)
    review.user_id = current_user.id
    review.movie_id = movie.id
    review.save
    redirect_to movie_path(movie.id)
  end

  def index
    @reviews = Review.all
  end

  def show
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to movie_path(movie.id)
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to movie_path(params[:movie_id])
  end

  private
  def review_params
    params.require(:review).permit(:title, :body)
  end

end
