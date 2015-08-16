FactoryGirl.define do
  factory :user do
    roles { |a| [a.association(:role)] }

    email {  Faker::Internet.email}
    password "password"
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

  end  
end