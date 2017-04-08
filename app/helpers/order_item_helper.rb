module OrderItemHelper
  
  def line_item(order_item)
    product_package = order_item.product_package
    product         = product_package.product
    total           = order_item.total
    quantity        = order_item.quantity
    "#{quantity} X #{product_package.product_quantity} pack of #{product.name} @ #{cents_to_dollars(product_package.value)}: #{cents_to_dollars(total)}"
  end

end
