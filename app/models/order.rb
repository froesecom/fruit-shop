class Order < ApplicationRecord

  has_many :product_requests, inverse_of: :order
  has_many :products, through: :product_requests, inverse_of: :orders

  accepts_nested_attributes_for :product_requests

end
