FactoryBot.define do
  factory :order do
    scheduled_delivery_date_id       { 5 }
    scheduled_delivery_time_id       { 5 }
    association :user

    after(:build) do |order|
      order.image.attach(io: File.open('public/images/sample.jpg'), filename: 'sample.jpg')
    end
  end
end
