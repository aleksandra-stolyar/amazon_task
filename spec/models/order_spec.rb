require_relative '../rails_helper'

describe Order, type: :model do
  subject { create :order }

  # validations
  it {expect(subject).to validate_presence_of :total_price}
  it {expect(subject).to validate_presence_of :completed_date}

  # associations
  it {expect(subject).to belong_to :user}
  it {expect(subject).to belong_to :credit_card}


  # describe "methods" do
  #   let(:book) {create :book}
  #   let(:order_item) {create :order_item}

  #   describe ".count_total_price" do
  #     it "calculates total_price" do
  #       expect(subject.count_total_price).to eq(book.price)
  #     end
  #   end

  # end

end  