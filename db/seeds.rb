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

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredient_serialized = open(url).read
ingredient_parsed = JSON.parse(ingredient_serialized)
ingredients = ingredient_parsed["drinks"]
ingredients.each do |ingredient|
  puts "XXXX"
  Ingredient.create(name: ingredient["strIngredient1"])
end

puts "creating cocktails..."





puts "creating doses..."


puts "finished!"
