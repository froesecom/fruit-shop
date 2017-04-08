module ProductRequestHelper
  
  def product_request_heading(pr)
    "#{pr.quantity} #{pr.product.name.pluralize(pr.quantity)}"
  end

end
