require_relative '../rails_helper'

describe Book, type: :model do
  subject { create :book }

  # validations
  it {expect(subject).to validate_presence_of :title}
  it {expect(subject).to validate_presence_of :price}
  it {expect(subject).to validate_presence_of :amount}

  # associations
  it {expect(subject).to belong_to :author}
  it {expect(subject).to belong_to :category}
  it {expect(subject).to have_many :ratings}


end 