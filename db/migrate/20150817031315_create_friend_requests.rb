class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
    	t.string :requesting_user_id
    	t.string :requested_user_id, :index => true

      t.timestamps
    end
  end
end
