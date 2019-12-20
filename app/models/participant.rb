class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :idea

  validates :user_id, presence: true, uniqueness: { scope: :idea_id }
  validates :idea_id, presence: true
end
