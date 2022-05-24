class Admin::HomesController < ApplicationController
  def top
    @movies = Movie.order(created_at: :desc).limit(5)
    @reviews = Review.order(created_at: :desc).limit(5)
  end
end
