module OrderItemOptimizer
  #responsibility: provide methods for finding optimal order_items for request
  #reason to change: required output changes

  #uses dynamic programming to find the minimum required packages, prioritizing bigger packages, which are less expensive
  def self.order_items_for(product_request)

    tracker = OptimalPackageTracker.new(product_request)
    self.determine_optimal_packages(tracker)

    if tracker.can_fulfill_request?
      product_request.can_fulfill = true
      tracker.finalize
      self.build_order_items_params(tracker)
    else
      product_request.can_fulfill = false
    end

  end

  private
  #pick min product packages for each package
  def self.determine_optimal_packages(tracker)
    tracker.available_packages.each do |package|
      self.pick_mins_for_package(package, tracker) 
    end
  end

  #iterate through the min packages picked array
  #and calculate the min packages that can be used for each value
  def self.pick_mins_for_package(package, tracker)
    
    tracker.min_packages_picked.each_with_index do |val, i|
      next if package.product_quantity > i #we can't create a target quantity of i using something bigger than i
      self.pick_or_leave_package(package, tracker, val, i) 
    end

  end

  #choose the smallest value (number of packages) that can be used to fulfill a target of i
  #if they are equal, choose the curent package, because it's larger and therefore less expensive (the packages are sorted in ascending order)
  # see EXPLANATION below
  def self.pick_or_leave_package(package, tracker, val, i)

    memoized_val = 1 + tracker.min_packages_picked[i - package.product_quantity]
    chosen_min     = [val, memoized_val].min

    if chosen_min != 1.0/0.0 && chosen_min == memoized_val
      tracker.update_picked_packages(package, chosen_min, i) 
    end
  end

  def self.build_order_items_params(tracker)
    h = {}

    tracker.chosen_packages.each do |p|
      h[p] ? self.update_item_order_params(h, p) : self.build_item_order_params(h, p, tracker)
    end
    
    h.values

    #should return [{product_package: product_package, order: product_request.order, quantity: 3}]
  end
  
  def self.build_item_order_params(h, p, tracker)
    h[p] = {product_package: p, order: tracker.product_request.order, quantity: 1 }
  end

  def self.update_item_order_params(h, p)
    h[p][:quantity] += 1
  end

end

#EXPLANATION
#Choose the smallest of the value we're currently look at
#or 1 + the value of array at [current_index - product_quantity].
#For example, if the current product_quantity is 3, and you're trying to figure if you can evenly deliver a total of 5 products
#you have to look at the value of index 2. If that can be calculated, then of course you can simply add the current package_quantity to it (+1 package) to achieve
#the total
