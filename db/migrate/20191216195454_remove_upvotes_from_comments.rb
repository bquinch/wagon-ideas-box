class RemoveUpvotesFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :upvote, :boolean
  end
end
