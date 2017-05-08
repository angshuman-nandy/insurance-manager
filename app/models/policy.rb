class Policy < ApplicationRecord
	belongs_to :company
	belongs_to :user 
	belongs_to :poltype
	validates :policy_type, presence: true
	validates :sum_insured, presence: true
	validates :premium_amount, presence: true
	validates :commission, presence: true
	validates :purchase_date, presence: true
	validates :mature_date,presence: true
	validates :user_id, presence: true
	validates :company_id, presence: true
	validates :poltype_id, presence: true
end
