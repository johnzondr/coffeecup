class ChangeVenueSpecialsDateType < ActiveRecord::Migration
  def change
  	add_column :venue_infos, :day, :integer
  end
end