class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end
  
  def update
    movie = Movie.find(params[:id])
    movie.update(movie_params)
    redirect_to admin_movie_path(movie.id)
  end
  
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to admin_movies_path
  end
  
  private
  def movie_params
    params.require(:movie).permit(:title, :body, :image)
  end
end
