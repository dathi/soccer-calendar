class RemoveTimestampsFromMatches < ActiveRecord::Migration
  def change
    remove_column :matches, :created_at, :string
    remove_column :matches, :updated_at, :string
  end
end
