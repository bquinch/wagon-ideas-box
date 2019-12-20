class RemoveFavoriteFromIdeas < ActiveRecord::Migration[5.2]
  def change
    remove_column :ideas, :favorite, :boolean
  end
end
