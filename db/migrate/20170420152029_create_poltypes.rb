class CreatePoltypes < ActiveRecord::Migration[5.0]
  def change
    create_table :poltypes do |t|
      t.string :name
      t.string :description
 
      t.timestamps
    end
  end
end
