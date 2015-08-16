require_relative '../rails_helper'

describe User, type: :model do
  subject { create :user }
  # validations
  it {expect(subject).to validate_presence_of :email}
  it {expect(subject).to validate_presence_of :password}
  
  # associations  
  it {expect(subject).to have_many :orders}
  it {expect(subject).to have_many :ratings}
    
end