class CreateVenueInfos < ActiveRecord::Migration
  def change
    create_table :venue_infos do |t|
    	t.integer :venue_id, :index => true
    	t.string :food
    	t.string :drinks
    	t.string :event
    	t.string :date, :index => true

      t.timestamps
    end
  end
end
