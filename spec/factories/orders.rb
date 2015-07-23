FactoryGirl.define do
  factory :order do
    association :customer, factory: :customer

    completed_date Faker::Date.between(2.days.ago, Date.today)
    total_price { Faker::Commerce.price }
    status 0
  end  
end