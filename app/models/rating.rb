class Rating < ActiveRecord::Base
  validates :text_review, presence: true
  validates :rate, inclusion: { in: 1..10 }

  belongs_to :user
  belongs_to :book
end
