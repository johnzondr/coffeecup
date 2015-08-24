class RenameDisabledtoHidden < ActiveRecord::Migration
  def change
  	rename_column :users, :disabled, :hidden
  end
end
