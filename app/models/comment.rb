class Comment < ApplicationRecord
  belongs_to :policy
	validates :body, presence: true
end
