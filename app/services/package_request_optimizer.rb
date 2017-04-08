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
      self.pick_or_leave_package(package, tracker, val, i) 
    end

  end

  #choose the smallest value (number of packages) that can be used to fulfill a target of i
  #if they are equal, choose the curent package, because it's larger and therefore less expensive (the packages are sorted in ascending order)
  # see EXPLANATION below
  def self.pick_or_leave_package(package, tracker, val, i)

    memoized_val = 1 + tracker.min_packages_picked[i - package.product_quantity]
    chosen_min     = [val, memoized_val].min

    puts "---"
    puts "val: #{val}"
    puts "memoizied_val: #{memoized_val}"

    if chosen_min != 1.0/0.0 && chosen_min == memoized_val
      tracker.update_picked_packages(package, chosen_min, i) 
    end

  end

end

#EXPLANATION
#Choose the smallest of the value we're currently look at
#or 1 + the value of array at [current_index - product_quantity].
#For example, if the current package_quantity is 3, and you're trying to figure if you can evenly deliver a total of 5
#you have to look at the value of index 2. If that can be calculated, then of course you can simply at the current package_quantity to it (+1 package) to achieve
#the total
