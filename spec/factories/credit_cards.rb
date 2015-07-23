FactoryGirl.define do
  factory :credit_card do
    association :customer, factory: :customer

    number { Faker::Business.credit_card_number }
    cvv { Faker::Number.number(3) }
    expiration_month 10
    expiration_year 2020
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end  
end