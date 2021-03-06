class Order < ApplicationRecord
  belongs_to :user
  has_many   :order_items
  has_one    :address
  has_one_attached :image

  with_options presence: true do
    validates :product_name
    validates :info
    validates :price
    validates :image
  end
end
