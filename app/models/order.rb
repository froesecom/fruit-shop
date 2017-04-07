class Order < ApplicationRecord
  #responsibilty: persistance of orders
  #reason to change: order schema changes

  has_many :product_requests, inverse_of: :order
  has_many :products, through: :product_requests, inverse_of: :orders

  accepts_nested_attributes_for :product_requests

  validates :product_requests, :order_items, :total, presence: true
  validates :processed, inclusion: { in: [true] } 

end
