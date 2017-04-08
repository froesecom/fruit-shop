class OrdersController < ApplicationController
  
  def create
    @order = Order.new(cleanse(order_params))
    OrderProcessor.new(@order).call
    @order.save
  end

  private
  
  def order_params
    params.require(:order).permit(product_requests_attributes: [:product_id, :quantity])
  end

  def cleanse(order_params)
    attributes = order_params[:product_requests_attributes].reject {|pra| pra[:quantity].to_i <= 0 }
    order_params[:product_requests_attributes] = attributes
    order_params
  end

end
