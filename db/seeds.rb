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
  Ingredient.create(name: ingredient["strIngredient1"])
end

puts "creating cocktails..."

url = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic"
cocktail_serialized = open(url).read
cocktail_parsed = JSON.parse(cocktail_serialized)
cocktails = cocktail_parsed["drinks"]
cocktails.each do |cocktail|
  Cocktail.create(name: cocktail["strDrink"])
end



puts "creating doses..."
Cocktail.all.each do |c|
  rand(2..5).times do
    Dose.create(cocktail: c, ingredient: Ingredient.all[rand(Ingredient.all.length)], description: "#{rand(20)} cl")
  end
end

puts "finished!"
