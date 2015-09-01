class AddInfoToVenues < ActiveRecord::Migration
  def change
  	add_column :venues, :food, :string
  	add_column :venues, :drinks, :string
  end
end
