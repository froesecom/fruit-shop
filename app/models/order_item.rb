class OrderItem < ApplicationRecord
  #responsiblity: join order to (currently) product_packages, with quanity.
  #given a generic name because it later may join products or anything else that can be purchased
  #reason to change: extension of what can be ordered

  belongs_to :order
  belongs_to :product_package
  
  validates :order, :product_package, :total, :quantity, presence: true
  validates :quantity, numericality: {greater_than: 0}
  
  before_validation :set_total
    
  private
  def set_total
    if product_package && quantity  
      self.total = self.product_package.value * self.quantity
    end
  end
end
