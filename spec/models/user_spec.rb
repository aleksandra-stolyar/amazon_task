require_relative '../rails_helper'

describe User, type: :model do
  subject { create :user }
  # it "is invalid without email and name" do
  #   expect(build(:user, email: nil, encrypted_password: nil, first_name: nil)).not_to be_valid
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