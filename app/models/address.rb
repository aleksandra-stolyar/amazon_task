class Address < ActiveRecord::Base
  validates :address, :zipcode, :city, :phone, :country_id, presence: true

  belongs_to :order

  scope :shipping_addresses, -> { where(address_type: 'ShippingAddress') } 
  scope :billing_addresses, -> { where(address_type: 'BillingAddress') } 

  self.inheritance_column = :address_type

  def self.address_types
      %w(ShippingAddress BillingAddress)
  end

end

class ShippingAddress < Address; end
class BillingAddress  < Address; end
