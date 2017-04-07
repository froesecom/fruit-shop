class OrdersController < ApplicationController
  
  def create
    @order = Order.new(order_params)
    OrderProcessor.new(@order).call
  end

  private
  
  def order_params
    params.require(:order).permit(product_requests_attributes: [:product_id, :quantity])
  end
end
