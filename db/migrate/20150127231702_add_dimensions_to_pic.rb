class AddDimensionsToPic < ActiveRecord::Migration
  def change
    add_column :pics, :dimensions, :string, limit: 30
  end
end
