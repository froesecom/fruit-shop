class OrderProcessor
  #responsiblity: provide interface between orders and the functionality required for processing orders
  #reason to change: processing requriments change

  def initialize(order)
    @order = order
  end
  
  def call
    puts "doing the things" 
  end

end
