class DropHolderNameFromPolicy < ActiveRecord::Migration[5.0]
  def change
  	remove_column :policies, :holder_name
  end
end
