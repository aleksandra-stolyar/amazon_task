FactoryGirl.define do
  factory :customer do
    # factory :confirmed_customer, :parent => :customer do
    #   after(:create) { |customer| customer.confirm! }
    # end
    email {  Faker::Internet.email}
    password "password"
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end  
end