class OptimalPackageTracker
  #responsibilty: manage the state required by the PackageRequestOptimizer while
  #that module hunts for the optimal package configuration for a ProductRequest
  #reason to change: definition of optimal package changes 
  
  attr_accessor :target, :final_packages, :current_packages_picked,
                :min_packages_picked, :available_packages

  def initialize(product_request)
    infinity                 = 1.0/0.0
    @final_packages          = []
    @target                  = product_request.quantity
    @available_packages      = product_request.product.product_packages.for_target(@target)
    @current_packages_picked = Array.new(@target + 1) #track which package has picked for a target value
    #track how many min packages are needed for a given value
    @min_packages_picked     = Array.new(@target + 1) {|i| i == 0 ? 0 : infinity}
  end


  def update_picked_packages(package, n_packages, i)
  end

end
