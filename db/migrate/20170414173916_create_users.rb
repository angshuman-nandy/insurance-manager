class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :password_digest, null: false, default: ""

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
  end
end
