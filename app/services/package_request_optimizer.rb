module PackageRequestOptimizer
  #responsibility: provide methods for finding optimal packages for request
  #reason to change: required output changes

  def self.packages_for(product_request)
    tracker = OptimalPackageTracker.new(product_request)
    tracker.available_packages.each_with_index do |package, j|
      self.pick_mins_for_package(package, tracker, j) 
    end
    #tracker.some_method returns the below
    #should return [{product_package: product_package, order: product_request.order, quantity: 3}]
  end

  private

  def self.pick_mins_for_package(package, tracker, j)
    puts j
    puts package.product.name    
  end

end
