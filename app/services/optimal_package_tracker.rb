class OptimalPackageTracker
  #responsibilty: manage the state required by the PackageRequestOptimizer while
  #that module hunts for the optimal package configuration for a ProductRequest
  #reason to change: definition of optimal package changes 
  
  attr_accessor :target, :order_item_params, :current_packages_picked,
                :min_packages_picked, :available_packages, :chosen_packages,
                :product_request

  def initialize(product_request)
    infinity                 = 1.0/0.0
    @product_request         = product_request
    @chosen_packages         = []
    @target                  = product_request.quantity
    @available_packages      = product_request.product.product_packages.for_target(@target)
    @current_packages_picked = Array.new(@target + 1) #track which package has picked for a target value
    #track how many min packages are needed for a given value
    @min_packages_picked     = Array.new(@target + 1) {|i| i == 0 ? 0 : infinity}
  end


  def update_picked_packages(package, n_packages, i)
    self.min_packages_picked[i] = n_packages
    self.current_packages_picked[i] = package
  end

  def can_fulfill_request?
    self.min_packages_picked.last.class == Fixnum #it's not infinity
  end
  
  def finalize
    collect_chosen_packages
  end

  private
  def collect_chosen_packages
    #work backwards from last chosen package
    i = current_packages_picked.length - 1

    while i > 0
      package = current_packages_picked[i]
      chosen_packages.push(package)
      i -= package.product_quantity
    end  

  end

end
