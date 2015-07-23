FactoryGirl.define do
  factory :country do
    country { Faker::Address.country }
  end  
end