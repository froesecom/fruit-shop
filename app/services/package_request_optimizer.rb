module PackageRequestOptimizer
  #responsibility: provide methods for finding optimal packages for request
  #reason to change: required output changes

  #uses dynamic programming to find the minimum required packages, prioritizing bigger packages, which are less expensive
  def self.packages_for(product_request)

    tracker = OptimalPackageTracker.new(product_request)

    tracker.available_packages.each do |package|
      self.pick_mins_for_package(package, tracker) 
    end
    #tracker.some_method returns the below
    #should return [{product_package: product_package, order: product_request.order, quantity: 3}]
  end

  private

  #iterate through the min packages picked array
  #and calculate the min packages that can be used for each value
  def self.pick_mins_for_package(package, tracker)
    
    tracker.min_packages_picked.each_with_index do |val, i|
      next if package.product_quantity > i #we can't create a target quantity of i using something bigger than i
      self.pick_or_leave_package(package, tracker, i) 
    end

  end

  #choose the smallest value (number of packages) that can be used to fulfill a target of i
  #if they are equal, choose the curent package, because it's larger and therefor less expensive (the packages are sorted in ascending order)
  def self.pick_or_leave_package(package, tracker, i)
    puts "blar"
  end

end
