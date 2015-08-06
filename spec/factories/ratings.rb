FactoryGirl.define do
  factory :rating do
    association :book, factory: :book
    association :user, factory: :user

    text_review { Faker::Lorem.sentence }
    rate { Faker::Number.between(1, 10) }
  end  
end