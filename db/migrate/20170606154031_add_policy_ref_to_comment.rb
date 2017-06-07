class AddPolicyRefToComment < ActiveRecord::Migration[5.0]
  def change
  	add_reference :comments, :policy, foreign_key: true
  end
end
