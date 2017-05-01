class DropAdminNameFromDetail < ActiveRecord::Migration[5.0]
  def change
  	remove_column :details, :admin_email
  end
end
