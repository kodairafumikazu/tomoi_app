class Product < ApplicationRecord
  
  has_one :order
  has_one_attached :image
  # extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :product_name
    validates :price
    validates :image
  end
end
