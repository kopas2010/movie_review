class User::HomesController < ApplicationController
  def top
    @movies = Movie.order(created_at: :desc).limit(3)
    @reviews = Review.order(created_at: :desc).limit(3)
  end
end
