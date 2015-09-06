class AddIdToInvitations < ActiveRecord::Migration

  def change
  	change_table :invitations do |t|
  		t.rename :inviter, :inviter_id
  		t.rename :invitee, :invitee_id
  	end
  end
end
