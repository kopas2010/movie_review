class Movie < ApplicationRecord
  has_one_attached :image

  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
end
