class AddPointToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :points, :integer
  end
end
