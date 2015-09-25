class AddMoreColumnsToTeams < ActiveRecord::Migration
  def change
  	change_table :teams do |t|
  	  t.integer :wins
  	  t.integer :draws
  	  t.integer :losts
  	  t.integer :goals_for
  	  t.integer :goals_against
  	  t.integer :goals_difference
  	end
  end
end
