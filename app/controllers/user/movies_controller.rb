class User::MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      render :new
    end
  end

  def index
    @movies = Movie.page(params[:page]).per(10)
  end

  def show
    @movie = Movie.find(params[:id])
    @review = Review.new
    @reviews = Review.all
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(movie_params)
    redirect_to movie_path(movie.id)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to "/movies"
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :body, :image)
  end
end
