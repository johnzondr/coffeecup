class AddJoinedZondrtoUsers < ActiveRecord::Migration
  def change
  	add_column :users, :installed_already, :boolean
  end
end
