class User < ApplicationRecord
	  before_save { self.email = email.downcase }
	has_one :detail, :dependent => :destroy 
	has_many :posts, :dependent => :destroy 
	has_many :policy, :dependent => :destroy 
	validates :email, presence: true
		
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
   has_secure_password
   validates :password, presence: true, length: { minimum: 6 }
end
