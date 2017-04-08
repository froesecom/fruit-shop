class ProductRequest < ApplicationRecord
  #responsiblity: persistence of product requests
  #reason to change: product requests schema changes

  belongs_to :order, inverse_of: :product_requests
  belongs_to :product, inverse_of: :product_requests

  validates :order, :product, presence: true
  validates :quanity, numericality: {greater_than: 0}

end
