class AddTimestampToInvitations < ActiveRecord::Migration
  def change
  	  add_column :invitations, :created_at, :datetime
      add_column :invitations, :updated_at, :datetime
  end
end
