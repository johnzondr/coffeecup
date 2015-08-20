class ChangeFriendRequestColumns < ActiveRecord::Migration
  def change
  	remove_column :friend_requests, :requesting_user_id
  	remove_column :friend_requests, :requested_user_id
  end
end
