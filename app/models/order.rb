class Order < ApplicationRecord
  #responsibilty: persistance of orders
  #reason to change: order schema changes

  has_many :product_requests, inverse_of: :order
  has_many :order_items, inverse_of: :order
  has_many :products, through: :product_requests, inverse_of: :orders
  has_many :product_packages, through: :order_items, inverse_of: :orders

  accepts_nested_attributes_for :product_requests

  validates :product_requests, :order_items, :total, presence: true

  def set_total
    t = 0
    order_items.each {|oi| t += oi.quantity * oi.product_package.value}
    self.total = t
  end

end
