class Book < ActiveRecord::Base
  validates :title, :price, :amount, presence: true

  belongs_to :author
  belongs_to :category

  has_many :ratings
  
end
