class Product < ApplicationRecord

  has_many :product_requests
  has_and_belongs_to_many :orders, through: :product_requests

end
