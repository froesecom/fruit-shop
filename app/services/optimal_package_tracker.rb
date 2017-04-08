class OptimalPackageTracker
  #responsibilty: manage the state required by the PackageRequestOptimizer while
  #that module hunts for the optimal package configuration for a ProductRequest
  #reason to change: definition of optimal package changes 
  
  attr_accessor :target, :order_item_params, :current_packages_picked,
                :min_packages_picked, :available_packages

  def initialize(product_request)
    infinity                 = 1.0/0.0
    @order_item_params          = []
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

  def finalize
    if can_meet_target?
      build_item_order_params
    end
  end

  def build_item_order_params
    #should return [{product_package: product_package, order: product_request.order, quantity: 3}]
    {}
  end
  
  private

  def can_meet_target?
    self.min_packages_picked.last.class == Fixnum #it's not infinity
  end

end
