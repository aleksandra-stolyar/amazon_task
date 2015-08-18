require_relative '../rails_helper'

describe User, type: :model do
  subject { create :user }
  # validations
  it {expect(subject).to validate_presence_of :email}
  it {expect(subject).to validate_presence_of :password}
  
  # associations  
  it {expect(subject).to have_many :orders}
  it {expect(subject).to have_many :ratings}

  # callbacks
  it "sets default customer role" do
    user = User.new
    expect(user.roles).to be_empty
    user.save
    expect(user.roles).not_to be_nil
  end
end