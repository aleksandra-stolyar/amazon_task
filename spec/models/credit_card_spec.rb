require_relative '../rails_helper'

describe CreditCard, type: :model do
  subject { create :credit_card }

  # validations
  it {expect(subject).to validate_presence_of :number}
  it {expect(subject).to validate_presence_of :cvv}
  it {expect(subject).to validate_presence_of :expiration_month}
  it {expect(subject).to validate_presence_of :expiration_year}
  it {expect(subject).to validate_presence_of :first_name}
  it {expect(subject).to validate_presence_of :last_name}

  # associations
  it {expect(subject).to belong_to :user}
  it {expect(subject).to have_many :orders}

end 