class CreateOfferedRewards < ActiveRecord::Migration
  def change
    create_table :offered_rewards do |t|
    	t.string :description
    	t.date :expires_at
    	t.date :activated_at
    	t.date :deactivated_at
    	t.integer :venue_id

      t.timestamps
    end
  end
end
