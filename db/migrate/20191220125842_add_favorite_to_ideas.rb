class AddFavoriteToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :favorite, :boolean, default: false
  end
end
