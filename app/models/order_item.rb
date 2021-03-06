class OrderItem < ApplicationRecord
  belongs to :order
  belongs to :product
  has_one_attached :image
end
