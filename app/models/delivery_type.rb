class DeliveryType < ActiveRecord::Base
  validates :name, :price, presence: true

  def title
    name + " #{price}"
  end

end