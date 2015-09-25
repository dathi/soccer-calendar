class AddDetailUrlToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :detail_url, :string
  end
end
