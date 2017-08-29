class Policy < ApplicationRecord
	belongs_to :company
	belongs_to :user 
	belongs_to :poltype
  has_many :comment, :dependent => :destroy
	validates :policy_type, presence: true
	validates :sum_insured, presence: true, :numericality => {:only_integer => true}
	validates :premium_amount, presence: true, :numericality => {:only_integer => true}
	validates :commission, presence: true
	validates :purchase_date, presence: true
	validates :mature_date,presence: true
	validates :user_id, presence: true
	validates :company_id, presence: true
	validates :poltype_id, presence: true
end
