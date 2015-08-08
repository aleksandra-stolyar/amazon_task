FactoryGirl.define do
  factory :user do
    # factory :confirmed_user, :parent => :user do
    #   after(:create) { |user| user.confirm! }
    # end
    email {  Faker::Internet.email}
    password "password"
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    roles 'admin'
  end  
end