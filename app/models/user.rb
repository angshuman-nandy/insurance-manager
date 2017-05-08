class User < ApplicationRecord
	has_one :detail, :dependent => :destroy 
	has_many :posts, :dependent => :destroy 
	has_many :policy, :dependent => :destroy 
	validates :email, presence: true
	validates_uniqueness_of :email
	validates_confirmation_of :password
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :encrypted_password, presence: true,length: { minimum: 8 }
                    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :recoverable
end
