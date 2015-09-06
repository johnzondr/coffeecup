class AddProfImageToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :pic_sm, :string
  end
end
