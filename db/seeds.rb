# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "cleaning database..."
Ingredient.destroy_all
Cocktail.destroy_all

puts "creating ingredients..."
lemon = Ingredient.create(name: "lemon")
ice = Ingredient.create(name: "ice")
mint_leaves = Ingredient.create(name: "mint leaves")
gin = Ingredient.create(name: "gin")
tonic = Ingredient.create(name: "tonic")
cucumber = Ingredient.create(name: "cucumber")
kalua = Ingredient.create(name: "kalua")
cointreau = Ingredient.create(name: "cointreau")
baileys = Ingredient.create(name: "baileys")

puts "creating cocktails..."
mojito = Cocktail.create!(name: "mojito")
gin_tonic = Cocktail.create!(name: "Gin Fizz")
b52 = Cocktail.create!(name: "b52")


puts "creating doses..."
Dose.create(description: "6cl", cocktail: mojito, ingredient: lemon)
Dose.create(description: "20cl", cocktail: mojito, ingredient: ice)
Dose.create(description: "10g", cocktail: mojito, ingredient: mint_leaves)
Dose.create(description: "6cl", cocktail: gin_tonic, ingredient: gin)
Dose.create(description: "15cl", cocktail: gin_tonic, ingredient: tonic)
Dose.create(description: "2g", cocktail: gin_tonic, ingredient: cucumber)
Dose.create(description: "3cl", cocktail: b52, ingredient: baileys)
Dose.create(description: "3cl", cocktail: b52, ingredient: cointreau)
Dose.create(description: "3cl", cocktail: b52, ingredient: kalua)

puts "finished!"
