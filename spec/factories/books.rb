FactoryGirl.define do
  factory :book do
    association :author, factory: :author
    categories { |a| [a.association(:category)] }

    title { Faker::Lorem.sentence(2, true, 2) }
    description { Faker::Lorem.paragraph(2, false, 4) } 
    price { Faker::Commerce.price }
    amount { Faker::Number.number(3) }
  end  
end