class ReAddFriendRequestColumns < ActiveRecord::Migration
  def change
  	add_column :friend_requests, :requesting_user_id, :integer
  	add_column :friend_requests, :requested_user_id, :integer
  end
end
