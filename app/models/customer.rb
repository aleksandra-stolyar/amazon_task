class Customer < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :first_name, :last_name, presence: true
  validates :email,                          confirmation: true

  has_many :orders
  has_many :ratings
end
