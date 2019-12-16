class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :description
      t.string :photo
      t.string :figma_link
      t.string :github_link
      t.string :db_link
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
