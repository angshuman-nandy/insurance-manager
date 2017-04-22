class AddCompanyRefToPoltypes < ActiveRecord::Migration[5.0]
  def change
    add_reference :poltypes, :company, foreign_key: true
  end
end
