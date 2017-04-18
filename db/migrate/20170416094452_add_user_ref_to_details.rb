class AddUserRefToDetails < ActiveRecord::Migration[5.0]
  def change
  	add_reference :details, :user, foreign_key: true
  end
end
