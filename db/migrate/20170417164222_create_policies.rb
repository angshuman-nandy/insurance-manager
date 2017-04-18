class CreatePolicies < ActiveRecord::Migration[5.0]
  def change
    create_table :policies do |t|
    	t.string :holder_name, null:false
    	t.string :policy_type
    	t.string :description
        t.decimal :sum_insured
     	t.decimal :premium_amount
      	t.decimal :commission
      	t.date 	:purchase_date
      	t.date 	:mature_date
      	
      	t.timestamps
    end
  end
end
