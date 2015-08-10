class Rating < ActiveRecord::Base
  enum state: { pending: 1, approved: 2, canceled: 3 }

  validates :text_review, presence: true
  validates :rate, inclusion: { in: 1..10 }

  belongs_to :user
  belongs_to :book

  after_initialize :set_state_pending

  def state_enum
    [['Pending', 1],['Approved', 2],['Canceled', 3]]
  end

  private

  def set_state_pending
    self.state ||= :pending #if self.state.blank?
  end

end
