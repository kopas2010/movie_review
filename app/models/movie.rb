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
end
