class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  has_one_attached :image

  with_options presence: true do
    validates :quantity
    validates :order_id
    validates :product_id
  end
end
