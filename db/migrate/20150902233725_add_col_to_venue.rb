class AddColToVenue < ActiveRecord::Migration
  def change
  	add_column :venues, :minor, :integer
  end
end
