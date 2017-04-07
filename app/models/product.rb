class Product < ApplicationRecord

  has_many :product_requests, inverse_of: :product
  has_many :orders, through: :product_requests, inverse_of: :products

end
