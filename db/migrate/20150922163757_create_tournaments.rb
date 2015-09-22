class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.references :tournament_type, index: true, foreign_key: true
    end
  end
end
