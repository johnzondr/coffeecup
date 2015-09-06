class AddColToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :fb_token, :string
  	add_column :users, :device_os, :string
  	add_column :users, :saved_area_id, :integer
  	add_column :users, :version, :float
  	rename_column :users, :most_recent_venue_id, :last_check_in_id
  end
end
