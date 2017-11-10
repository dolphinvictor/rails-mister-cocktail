# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'

puts 'cleaning database'
Cocktail.destroy_all
Ingredient.destroy_all

puts 'Creating 30 ingredients from JSON...'

require "open-uri"
url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
data = JSON.parse(open(url).read)

data["drinks"].each do |ingredient_attributes|
  Ingredient.create(name: ingredient_attributes["strIngredient1"])
end

puts 'Creating 15 fake cocktails...'
15.times do
  cocktail = Cocktail.new({
    name: Faker::Pokemon.move,
    })
  cocktail.save!
  3.times do
    ingredient = Ingredient.all.sample
    Dose.create(cocktail: cocktail, ingredient: ingredient)
  end
end

puts 'Finished!'
