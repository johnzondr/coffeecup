class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
    	t.integer :venue_id, :index => true
    	t.integer :user_id, :index => true
    	t.datetime :first_signal_at
    	t.datetime :last_signal_at

      t.timestamps :index => true
    end
  end
end
