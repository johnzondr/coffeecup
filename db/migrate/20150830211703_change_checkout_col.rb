class ChangeCheckoutCol < ActiveRecord::Migration
  def change
  	rename_column :checkins, :checkout, :checkout_time
  end
end
