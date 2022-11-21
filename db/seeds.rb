# frozen_string_literal: false

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts %(Cleaning up database...)
Offer.destroy_all
Product.destroy_all
User.destroy_all

# Category.destroy_all
# Subcategory.destroy_all
puts %(Database cleaned!)

card = Category.create!(name: "card")
steam = Subcategory.create!(name: "Steam Wallet", category: card)
apple = Subcategory.create!(name: "Apple iTunes", category: card)
blizzard = Subcategory.create!(name: "Blizzard", category: card)

16.times do
  new_user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 123_456
  )
  puts "User with id: #{new_user.id} has been created"

  5.times do
    product = Product.create!(
      name: ["Gift Card USD 15", "Gift Card USD 20", "Gift Card USD 25", "Gift Card USD 30", "Gift Card USD 35", "Gift Card USD 40", "Gift Card USD 50", "Gift Card USD 70", "Gift Card USD 100", "Gift Card USD 150", "Gift Card USD 200", "Gift Card USD 250", "Gift Card USD 500"].sample,
      price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
      subcategory: Subcategory.all.sample,
      quantity: rand(50..200),
      user: new_user
    )
    puts "Product with id: #{product.id} has been created"
  end
end

# chosen_name = name(chosen_sub).sample
# def name(new_subcategory)
#   case new_subcategory
#   when 'Apple iTunes'
#     return ["iTunes Gift Card USD 15", "iTunes Gift Card USD 20", "iTunes Gift Card USD 25", "iTunes Gift Card USD 30", "iTunes Gift Card USD 35", "iTunes Gift Card USD 40", "iTunes Gift Card USD 50", "iTunes Gift Card USD 70", "iTunes Gift Card USD 100", "iTunes Gift Card USD 150", "iTunes Gift Card USD 200", "iTunes Gift Card USD 250", "iTunes Gift Card USD 500"]
#   when 'Steam Wallet'
#     return ["Steam Wallet Code USD 5", "Steam Wallet Code USD 10", "Steam Wallet Code USD 20", "Steam Wallet Code USD 25", "Steam Wallet Code USD 30", "Steam Wallet Code USD 50", "Steam Wallet Code USD 100"]
#   when 'Blizzard'
#     return ["Blizzard Gift Card Battle.net USD 5", "Blizzard Gift Card Battle.net USD 10", "Blizzard Gift Card Battle.net USD 20", "Blizzard Gift Card Battle.net USD 50"]
#   else
#     return ["Random Name"]
#   end
# end

# categories = ["Gift Cards", "Video Games"]
# category = categories.sample

# def subcategories(category)
#   case category
#   when "Gift Cards"
#     return ['Apple iTunes', 'Steam Wallet', 'Blizzard']
#   when "Video Games"
#     return ["7 Days to Die PC - Steam", "Back 4 Blood PC - Steam", "Battlefield V PC - Origin"]
#   end
# end



# chosen_subs = subcategories(category)
# chosen_sub = chosen_subs.sample


# sub_models = chosen_subs.map do |a|
#   c = Category.find_or_create_by(name: category)
#   Subcategory.find_or_create_by(name: a, category: c)
# end


# product_names = ['Apple iTunes', 'Steam Wallet', 'Blizzard']
# categories = ['Gift Cards', 'Video Games']
# prefixes = {
#   'Apple iTunes': [ "iTunes Gift Card USD 15", "iTunes Gift Card USD 20", "iTunes Gift Card USD 25", "iTunes Gift Card USD 30", "iTunes Gift Card USD 35", "iTunes Gift Card USD 40", "iTunes Gift Card USD 50", "iTunes Gift Card USD 70", "iTunes Gift Card USD 100", "iTunes Gift Card USD 150", "iTunes Gift Card USD 200", "iTunes Gift Card USD 250", "iTunes Gift Card USD 500"
#   ],
#   'Steam Wallet': [ "Steam Wallet Code USD 5", "Steam Wallet Code USD 10", "Steam Wallet Code USD 20", "Steam Wallet Code USD 25", "Steam Wallet Code USD 30", "Steam Wallet Code USD 50", "Steam Wallet Code USD 100"

#   ],
#   'Blizzard': [ "Blizzard Gift Card Battle.net USD 5", "Blizzard Gift Card Battle.net USD 10", "Blizzard Gift Card Battle.net USD 20", "Blizzard Gift Card Battle.net USD 50"
#   ]
# }
