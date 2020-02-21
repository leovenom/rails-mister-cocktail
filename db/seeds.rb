# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
require 'open-uri'

# require 'net/http'
# url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# uri = URI(url)
# response = Net::HTTP.get(uri)
# JSON.parse(response)

francisco = RestClient.get('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
ing = JSON.parse(francisco.body)

ing.each do |array|
  array[1].each do |el|
   Ingredient.create(name: el["strIngredient1"])
  end
end

# info = {numb: '1'}


# array = [false, true]
# array[0]


# facebook = {
#   users: {
#     "francisco": 23,
#     "joao": 32
#   }
# }

# facebook[:users]["francisco"]

