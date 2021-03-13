class Order < ApplicationRecord
  belongs_to :user
  has_many   :order_items
  has_one    :address
  has_one_attached :image

  with_options numericality: { other_than: 1 } do
    validates :scheduled_delivery_date_id
    validates :scheduled_delivery_time_id
  end
  with_options presence: true do
    validates :user_id
  end
end
