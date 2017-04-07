class Order < ApplicationRecord

  has_many :product_requests
  has_and_belongs_to_many :products, through: :product_requests

  accepts_nested_attributes_for :product_requests

end
