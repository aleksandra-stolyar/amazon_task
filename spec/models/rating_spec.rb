require_relative '../rails_helper'

describe Rating, type: :model do
  subject { create :rating }

  # validations
  it {expect(subject).to validate_presence_of :text_review}
  it {expect(subject).to validate_inclusion_of(:rate).in_range(1..10)}

  # associations
  it {expect(subject).to belong_to :user}
  it {expect(subject).to belong_to :book}  

end 