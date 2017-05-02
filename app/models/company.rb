class Company < ApplicationRecord
	has_many :poltype
	has_many :policy 
	validates :name, presence: true
end
