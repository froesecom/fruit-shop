class OrderItem < ApplicationRecord
  #responsiblity: join order to (currently) product_packages, with quanity.
  #given a generic name because it later may join products or anything else that can be purchased
  #reason to change: extension of what can be ordered

  belongs_to :order
  belongs_to :product_package
  
  validates :order, :product_package, :quantity, presence: true

end
