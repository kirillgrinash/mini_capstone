# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
product = Product.new(name: "Health Potion", price: 50, description: "recovers a small portion of your health")
product.save
product = Product.new(name: "Mana Potion", price: 25, description: "recovers a small portion of your mana")
product.save
product = Product.new(name: "Health Buff", price: 60, description: "buffs your health for a duration")
product.save
