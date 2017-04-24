class AddPoltypeReferenceToPolicies < ActiveRecord::Migration[5.0]
  def change
  	add_reference :policies, :poltype, foreign_key: true
  end
end
