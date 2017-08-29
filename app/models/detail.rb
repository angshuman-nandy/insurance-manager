class Detail < ApplicationRecord
	belongs_to :user
	self.primary_key = "email"
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :contact_number,presence: true, :numericality => {:only_integer => true}, length: { is: 10 , message: "length should be 10"} 
	validates :address, format: { with: /\A[a-zA-Z0-9, .]*\z/,
    message: "only letters numbers \",\" \".\" and space are allowed" }, presence: true
end
