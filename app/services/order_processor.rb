class OrderProcessor
  #responsiblity: provide interface between orders and the functionality required for processing orders
  #reason to change: processing requriments change

  def initialize(order)
    @order = order
  end
  
  def call
    build_order_items
    @order.set_total
  end

  private

  def build_order_items
    #this could be optimized to find all required packages in one db query
    #but given there are only 3 products currently, this felt premature
    @order.product_requests.each do |pr|
      order_items_params = OrderItemOptimizer.order_items_for(pr)

      if order_items_params 
        order_items_params.each do |oip|
          @order.order_items << OrderItem.new(oip)
        end
      end
    end

  end
end
