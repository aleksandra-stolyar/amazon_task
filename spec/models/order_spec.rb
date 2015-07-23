require_relative '../rails_helper'

describe Order, type: :model do
  subject { create :order }

  # validations
  it {expect(subject).to validate_presence_of :total_price}
  it {expect(subject).to validate_presence_of :completed_date}

  # associations
  it {expect(subject).to belong_to :customer}
  it {expect(subject).to belong_to :credit_card}

end  