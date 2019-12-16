class Idea < ApplicationRecord
  belongs_to :user
  validates :description, presence: true
  validates :title, presence: true
  has_many_attached :photos
end