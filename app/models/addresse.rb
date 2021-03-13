class Addresse < ApplicationRecord
  belongs_to :user
  has_many   :orders
  has_one_attached :image

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :town
    validates :phone_number, format: { with: /\A[0-9]{11}\z/ }
    validates :user_id
    #validates :token
  end
end
