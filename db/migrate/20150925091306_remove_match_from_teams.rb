class RemoveMatchFromTeams < ActiveRecord::Migration
  def change
  	remove_reference :teams, :match
  end
end
