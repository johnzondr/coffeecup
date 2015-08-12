class CreateEarnedRewards < ActiveRecord::Migration
  def change
    create_table :earned_rewards do |t|
    	t.integer :user_id, :index => true
    	t.integer :offered_reward_id, :index => true
    	t.boolean :claimed
    	t.string :reward_description
    	t.integer :venue_id, :index => true
    	t.date :expires_at

      t.timestamps
    end
  end
end
