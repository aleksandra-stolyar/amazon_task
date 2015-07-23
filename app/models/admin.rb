class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :validatable, :registerable, :recoverable, :rememberable and :omniauthable
  devise :database_authenticatable, 
          :trackable, :timeoutable, :lockable
end
