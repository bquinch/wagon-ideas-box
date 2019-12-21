class AddColumnsToIdea < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :pain, :text
    add_column :ideas, :target, :text
    add_column :ideas, :solution, :text
    add_column :ideas, :originality, :text
  end
end
