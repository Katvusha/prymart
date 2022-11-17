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
puts %(Database cleaned!)

16.times do
  new_user = User.create(
    email: Faker::Internet.email,
    password: 123_456
  )
  new_user.save!
  puts "User with id: #{new_user.id} has been created"

  16.times do
    product = Product.create!(
      name: Faker::Company.name,
      price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
      category: ['Apple iTunes', 'Steam Wallet', 'Blizzard'].sample,
      content: Faker::Alphanumeric.alpha(number: 16),
      user: User.all.sample
    )
    product.user = new_user
    product.save!
    puts "Product with id: #{product.id} has been created"
  end
end
