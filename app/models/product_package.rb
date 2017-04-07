class ProductPackage < ApplicationRecord
  #responsibilty: product_package persistence
  #reason to change: schema of product package changes

  belongs_to :product
  has_many :orders, through: :order_items, inverse_of: :product_packages
  has_many :order_items, inverse_of: :product_package

end
