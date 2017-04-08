class ProductPackage < ApplicationRecord
  #responsibilty: product_package persistence
  #reason to change: schema of product package changes

  belongs_to :product
  has_many :orders, through: :order_items, inverse_of: :product_packages
  has_many :order_items, inverse_of: :product_package

  validates :product, :value, :product_quantity, presence: true 
  validates :product_quantity, numericality: {greater_than: 0}

  scope :for_target, ->(target) do
    where.not("product_quantity > ?", target)
    .order(:product_quantity)
  end

end
