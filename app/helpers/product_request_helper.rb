module ProductRequestHelper
  
  def product_request_heading(pr, total)
    "#{pr.quantity} #{pr.product.name.pluralize(pr.quantity)} #{cents_to_dollars(total)}"
  end

end
