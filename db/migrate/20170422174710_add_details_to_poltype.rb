class AddDetailsToPoltype < ActiveRecord::Migration[5.0]
  def change
    add_column :poltypes, :duration, :integer
    add_column :poltypes, :premium_amount, :decimal
    add_column :poltypes, :sum_insured, :decimal
  end
end
