FactoryBot.define do
  factory :order_item do
    quantity { '2' }
    association :order
    association :product
  end
end
