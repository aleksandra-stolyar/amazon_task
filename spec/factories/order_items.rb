FactoryGirl.define do
  factory :order_item do
    association :book, factory: :book
    association :order, factory: :order

    quantity { Faker::Number.digit }
  end  
end