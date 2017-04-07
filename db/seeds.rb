#I would usually use seed migrations for this, but ain't nobody got time for that right now

prod_names = ["Watermelon", "Rockmelon", "Pineapple"]

prod_names.each {|p| Product.create!(name: p)}
