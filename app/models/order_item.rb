class OrderItem < ApplicationRecord
  belongs to :order
  belongs to :product
  has_one_attached :image

  with_options presence: true do
    validates :quantity
    validates :order_id
    validates :product_id
  end
end
