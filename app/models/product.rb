class Product < ApplicationRecord
  #responsiblity: persistence of products
  #reason to change: product schema changes

  has_many :product_requests, inverse_of: :product
  has_many :orders, through: :product_requests, inverse_of: :products

end
