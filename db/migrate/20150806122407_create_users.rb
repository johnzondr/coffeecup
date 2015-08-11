class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.date :birthdate
    	t.string :gender
    	t.string :device_id
    	t.string :status
		t.integer :most_recent_venue_id, :index => true
		t.string :type
		t.boolean :disabled    	

      t.timestamps :index => true

    end
  end
end
