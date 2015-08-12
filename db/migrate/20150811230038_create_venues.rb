class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
    	t.string :name
    	t.string :city, :index => true
    	t.string :state
    	t.string :type, :index => true

      t.timestamps
    end
  end
end
