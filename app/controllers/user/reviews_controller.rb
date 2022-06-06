class User::ReviewsController < ApplicationController

  def create
    movie = Movie.find(params[:movie_id])
    review = Review.new(review_params)
    review.user_id = current_user.id
    review.movie_id = movie.id

    review.save
    redirect_to movie_path(movie.id)
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @review = Review.find(params[:id])
    unless @review.user == current_user
      redirect_to  root_path
    end
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to movie_path(review.movie.id)
  end

  def index
    @reviews = Review.page(params[:page]).per(10)
  end

  def destroy
    review = Review.find(params[:id])
    Review.find(params[:id]).destroy
    redirect_to movie_path(review.movie.id)
  end

  private
  def review_params
    params.require(:review).permit(:title, :body, :star)
  end

end