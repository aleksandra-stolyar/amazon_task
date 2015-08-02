require_relative '../rails_helper'

describe Customer, type: :model do
  subject { create :customer }
  # it "is invalid without email and name" do
  #   expect(build(:customer, email: nil, encrypted_password: nil, first_name: nil)).not_to be_valid
  # end

  # validations
  it {expect(subject).to validate_presence_of :email}
  it {expect(subject).to validate_presence_of :password}
  it {expect(subject).to validate_presence_of :first_name}
  it {expect(subject).to validate_presence_of :last_name}
  
  # associations  
  it {expect(subject).to have_many :orders}
  it {expect(subject).to have_many :ratings}
    
end