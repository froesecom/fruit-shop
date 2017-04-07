#I would usually use seed migrations for this, but ain't nobody got time for that right now

watermelon =  Product.create!(name: "Watermelon")
rockmelon = Product.create!(name: "Rockmelon")
pineapple =  Product.create!(name: "Pineapple")

waterm_pp = [{product_quantity: 3, value: 699}, {product_quantity: 5, value: 899}]
rock_pp = [{product_quantity: 3, value: 595}, {product_quantity: 5, value: 995}, {product_quantity: 9, value: 1699}]
pine_pp = [{product_quantity: 2, value: 995}, {product_quantity: 5, value: 1695}, {product_quantity: 8, value: 2495}]

waterm_pp.each {|pp| new = ProductPackage.new(pp); new.product = watermelon; new.save!}
rock_pp.each {|pp| new = ProductPackage.new(pp); new.product = rockmelon; new.save!}
pine_pp.each {|pp| new = ProductPackage.new(pp); new.product = pineapple; new.save!}
