class Address < ActiveRecord::Base
  validates :address, :zipcode, :city, :phone, :country_id, presence: true
  
  belongs_to :order
  self.inheritance_column = :address_type
end
