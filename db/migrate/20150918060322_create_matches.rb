class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :home
      t.string :guest
      t.string :happen_time
      t.string :score

      t.timestamps null: false
    end
  end
end
