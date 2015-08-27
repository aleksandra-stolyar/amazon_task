class DeliveryType < ActiveRecord::Base
  validates :name, :price, presence: true

end