require_relative '../rails_helper'

describe Rating, type: :model do
  let(:subject) { create :rating }
  let(:book) {create :book}
  let(:user) {create :user}
  # validations
  it {expect(subject).to validate_presence_of :text_review}
  it {expect(subject).to validate_inclusion_of(:rate).in_range(1..10)}

  # associations
  it {expect(subject).to belong_to :user}
  it {expect(subject).to belong_to :book}  

  # callbacks
  it "sets pending state when initialized" do
    rating = Rating.new
    expect(rating.state).not_to be_nil
  end
end 