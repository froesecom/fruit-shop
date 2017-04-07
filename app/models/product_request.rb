class ProductRequest < ApplicationRecord

  belongs_to :order, inverse_of: :product_requests
  belongs_to :product, inverse_of: :product_requests


end
