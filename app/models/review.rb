class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
end
