class RemovePhotoFromIdea < ActiveRecord::Migration[5.2]
  def change
    remove_column :ideas, :photo, :string
  end
end
