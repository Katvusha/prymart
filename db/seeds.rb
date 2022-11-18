# frozen_string_literal: false

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts %(Cleaning up database...)
Product.destroy_all
User.destroy_all
Category.destroy_all
Subcategory.destroy_all
puts %(Database cleaned!)

16.times do
  new_user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 123_456
  )
  puts "User with id: #{new_user.id} has been created"

  categories = ["Gift Cards", "Video Games"]
  category = categories.sample

  def subcategories(category)
    case category
    when "Gift Cards"
      return ['Apple iTunes', 'Steam Wallet', 'Blizzard']
    when "Video Games"
      return ["7 Days to Die PC - Steam", "Back 4 Blood PC - Steam", "Battlefield V PC - Origin"]
    end
  end

  def name(subcategory)
    case subcategory
    when 'Apple iTunes'
      return ["iTunes Gift Card USD 15", "iTunes Gift Card USD 20", "iTunes Gift Card USD 25", "iTunes Gift Card USD 30", "iTunes Gift Card USD 35", "iTunes Gift Card USD 40", "iTunes Gift Card USD 50", "iTunes Gift Card USD 70", "iTunes Gift Card USD 100", "iTunes Gift Card USD 150", "iTunes Gift Card USD 200", "iTunes Gift Card USD 250", "iTunes Gift Card USD 500"]
    when 'Steam Wallet'
      return ["Steam Wallet Code USD 5", "Steam Wallet Code USD 10", "Steam Wallet Code USD 20", "Steam Wallet Code USD 25", "Steam Wallet Code USD 30", "Steam Wallet Code USD 50", "Steam Wallet Code USD 100"]
    when 'Blizzard'
      return ["Blizzard Gift Card Battle.net USD 5", "Blizzard Gift Card Battle.net USD 10", "Blizzard Gift Card Battle.net USD 20", "Blizzard Gift Card Battle.net USD 50"]
    else
      return ["Random Name"]
    end
  end

  chosen_subs = subcategories(category)
  chosen_sub = chosen_subs.sample
  chosen_name = name(chosen_sub).sample

  sub_models = chosen_subs.map do |a|
    c = Category.find_or_create_by(name: category)
    Subcategory.find_or_create_by(name: a, category: c)
  end

  5.times do
    product = Product.create!(
      name: chosen_name,
      price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
      subcategories: sub_models,
      quantity: rand(50..200),
      user: new_user
    )
    puts "Product with id: #{product.id} has been created"
  end
end

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
