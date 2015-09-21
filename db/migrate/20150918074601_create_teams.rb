class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :played_number
      t.integer :rank
      t.integer :points
    end
  end
end
