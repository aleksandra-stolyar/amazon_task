class Customer < ActiveRecord::Base
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, :omniauth_providers => [:facebook]

  validates :email, :password, :first_name, :last_name, presence: true
  validates :email, uniqueness: true


  has_many :orders
  has_many :ratings
end
