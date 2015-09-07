class CreditCard < ActiveRecord::Base
  validates :number, :cvv, :expiration_month, :expiration_year,
            :first_name, :last_name, presence: true

  validates :number, length: { in: 12..19 }
  validates :cvv, length: { is: 3 }
  validates :expiration_month, length: { in: 1..12}
  validates :expiration_year, numericality: { only_integer: true, 
                                              greater_than_or_equal_to: Date.today.year,
                                              less_than_or_equal_to: Date.today.year+10
                                            }

  belongs_to :user
  belongs_to :order

  def hide_number
    "** ** ** #{self.number.last(4)}"
  end
end
