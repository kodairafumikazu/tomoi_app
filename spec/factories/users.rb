FactoryBot.define do
  factory :user do
    password              { 'ab1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    name                  { '山田太郎' }
    email                 { Faker::Internet.free_email }
  end
end
