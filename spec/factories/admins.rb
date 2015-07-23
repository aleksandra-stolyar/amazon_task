FactoryGirl.define do
  factory :admin do
    email {  Faker::Internet.email}
    encrypted_password { Faker::Internet.password(8) }
  end
end
