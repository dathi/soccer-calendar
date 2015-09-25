class RemoveTimestampsFromTeams < ActiveRecord::Migration
  def change
  	remove_column :teams, :created_at, :string
  	remove_column :teams, :updated_at, :string
  end
end
