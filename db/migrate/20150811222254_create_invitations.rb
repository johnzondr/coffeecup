class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
    	t.integer :inviter, :index => true
    	t.integer :invitee, :index => true
    	t.integer :venue_id, :index => true
    end
  end
end
