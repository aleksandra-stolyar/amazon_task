FactoryGirl.define do
  factory :address do
    association :country, factory: :country
    association :order, factory: :order

    address { Faker::Address.street_address }
    zip_code { Faker::Address.zip_code }
    city { Faker::Address.city }
    phone { Faker::PhoneNumber.cell_phone }
  end  
end