class Rating < ActiveRecord::Base
  validates :text_review
  validates :rate, 

  belongs_to :customer
end
