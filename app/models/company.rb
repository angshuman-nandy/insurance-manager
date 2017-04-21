class Company < ApplicationRecord
	has_many :poltype
	validates :name, presence: true
end
