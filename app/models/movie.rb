class Movie < ApplicationRecord
  has_one_attached :image

  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @movie = Movie.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @movie = Movie.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @movie = Movie.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @movie = Movie.where("title LIKE?","%#{word}%")
    else
      @movie = Movie.all
    end
  end
end
