class AddTeamCompletedToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :team_completed, :boolean, default: false
  end
end
