class Detail < ApplicationRecord
	belongs_to :user
	self.primary_key = "email"
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :contact_number,presence: true, :numericality => {:only_integer => true}
	validates :address, presence: true
end
