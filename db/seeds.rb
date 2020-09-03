# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create(name: "health potion", price: 50, description: "recovers a small portion of your health")
Product.create(name: "mana potion", price: 25, description: "recovers a small portion of your mana")
Product.create(name: "health buff", price: 75, description: "buffs your health")
