class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :idea, foreign_key: true
      t.references :user, foreign_key: true
      t.text :message
      t.boolean :upvote

      t.timestamps
    end
  end
end
