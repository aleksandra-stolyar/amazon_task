class Rating < ActiveRecord::Base
  enum state: { pending: 1, approved: 2, canceled: 3 }

  validates :text_review, presence: true
  validates :rate, inclusion: { in: 1..10 }

  belongs_to :user
  belongs_to :book

  before_create :set_state

  private

  def set_state
    self.pending! if self.state.blank?
  end

end
