class Product < ApplicationRecord
  has_many :order_items
  has_one_attached :image
  # extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :product_name
    validates :price
    validates :info
    validates :image
  end
  def previous 
    Product.where("id < ?", self.id).order("id DESC").first 
  end 
  
  def next 
    Product.where("id > ?", self.id).order("id ASC").first 
  end
end
