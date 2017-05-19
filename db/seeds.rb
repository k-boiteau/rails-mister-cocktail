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

puts "creating ingredient..."
url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients_serialized = open(url).read
ingredients_parsed = JSON.parse(ingredients_serialized)
ingredients = ingredients_parsed["drinks"]
ingredients.each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

puts "creating cocktails..."

url = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic"
cocktail_serialized = open(url).read
cocktail_parsed = JSON.parse(cocktail_serialized)
cocktails = cocktail_parsed["drinks"]
cocktails.each do |cocktail|
  url = cocktail["strDrinkThumb"]
  drink = Cocktail.new(name: cocktail["strDrink"])
  drink.remote_photo_url = url
  drink.save
  url = "http://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=" + cocktail["idDrink"]
  ingredient_serialized = open(url).read
  ingredient_parsed = JSON.parse(ingredient_serialized)
  ingredients = ingredient_parsed["drinks"]
  ingredients.each do |ingredient|
    puts "creating dose..."
    15.times do |i|
      if ingredient["strIngredient#{i+1}"] != ""
        Dose.create(cocktail: drink, ingredient: Ingredient.where(name: ingredient["strIngredient#{i+1}"]).first, description: ingredient["strMeasure#{i+1}"])
      end
    end
  end
end

puts "finished!"
