FactoryGirl.define do
  factory :order_item do
    association :book, factory: :book
    association :order, factory: :order
    association :cart, factory: :cart

    quantity 1
    price {OrderItem.price }
  end  
end