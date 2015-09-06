class ChangeCheckinCol < ActiveRecord::Migration
  def change
  	rename_column :checkins, :last_signal_at, :checkout
  end
end
