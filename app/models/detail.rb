class Detail < ApplicationRecord
	belongs_to :user
	self.primary_key = "email"
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :contact_number,presence: true, :numericality => {:only_integer => true}, length: { minimum: 10 } ,length: { maximum: 12 }
	validates :address, presence: true
end
