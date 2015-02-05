class AddDescriptionToPics < ActiveRecord::Migration
  def change
    add_column :pics, :description, :string
  end
end
