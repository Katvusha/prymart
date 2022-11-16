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
puts %(Database cleaned!)

10.times do
  Product.create(
    name: Faker::Company.name,
    price: Faker::Number.decimal(l_digits: 2, r_digits: 2)
  )
end
puts %(Products created)
