class AddNamesToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, limit: 32
    add_column :users, :middle_names, :string, limit:32
    add_column :users, :last_name, :string, limit: 32
    add_column :users, :screen_name, :string, limit: 32
  end
end
