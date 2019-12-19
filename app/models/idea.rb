class Idea < ApplicationRecord
  belongs_to :user
  validates :description, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  has_many_attached :photos
  has_many :comments, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  acts_as_taggable
end
