class Detail < ApplicationRecord
	belongs_to :user
	validates_associated :user
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :contact_number,presence: true, :numericality => {:only_integer => true}
	validates :address, presence: true
end
