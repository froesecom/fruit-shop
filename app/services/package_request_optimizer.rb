module PackageRequestOptimizer
  #responsibility: provide methods for finding optimal packages for request
  #reason to change: required output changes

  def self.packages_for(product_request)
    puts product_request.quantity 
    #should return [{product_package: product_package, order: product_request.order, quantity: 3}]
  end

end
