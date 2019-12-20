class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.references :user, foreign_key: true
      t.references :idea, foreign_key: true
      t.boolean :interested, default: true
      t.boolean :participating, default: false
      t.text :comment

      t.timestamps
    end
  end
end
