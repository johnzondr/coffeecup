class CreateIbeacons < ActiveRecord::Migration
  def change
    create_table :ibeacons do |t|
    	t.integer :venue_id, :index => true
    	t.string :city, :index => true
    	t.integer :uuid
    	t.integer :major
    	t.integer :minor


      t.timestamps
    end
  end
end
