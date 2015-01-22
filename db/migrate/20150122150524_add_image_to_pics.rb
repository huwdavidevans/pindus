class AddImageToPics < ActiveRecord::Migration
  def self.up
    add_attachment :pics, :image
  end

  def self.down
    remove_attachment :pics, :image
  end
end