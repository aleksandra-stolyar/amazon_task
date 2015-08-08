class Rating < ActiveRecord::Base
  enum state: { pending: 1, approved: 2, canceled: 3 }

  validates :text_review, presence: true
  validates :rate, inclusion: { in: 1..10 }

  belongs_to :user
  belongs_to :book


end
