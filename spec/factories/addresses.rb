FactoryBot.define do
  factory :addresse do
    postal_code    { '123-4567' }
    prefecture_id  { 3 }
    city           { '横浜市緑区' }
    town           { '青山1-1-1' }
    building       { 'ハイツ-101' }
    phone_number   { '09012345678' }
    #token          { 'token090' }
    association :user
  end
end
