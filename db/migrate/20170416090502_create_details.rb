class CreateDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :details, id: false do |t|
    	t.string :email, null: false
    	t.string :first_name
    	t.string :last_name
    	t.boolean :admin
    	t.string :admin_email
    	t.string :contact_number
    	t.string :address

      t.timestamps
    end
  end
end
