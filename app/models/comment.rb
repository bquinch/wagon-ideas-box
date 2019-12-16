class Comment < ApplicationRecord
  belongs_to :idea
  belongs_to :user
  validates :message, presence: true
end
