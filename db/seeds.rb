# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Recipe.destroy_all

def recipe_builder(id)
  url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{id}"
  url_json = URI.parse(url).read
  recipe_details = JSON.parse(url_json)
  recipe_data = recipe_details["meals"][0]

  name = recipe_data["strMeal"]
  description = recipe_data["strInstructions"]
  image_url = recipe_data["strMealThumb"]
  rating = rand(2.0..5.0)

    return recipe = Recipe.create!(
    name: name,
    description: description,
    rating: rating,
    image_url: image_url
  )
end




Recipe.create!(
  name: "Classic Margherita Pizza",
  description: "A simple pizza with fresh mozzarella, tomatoes, and basil.",
  rating: 4.5,
  image_url: "https://www.onceuponachef.com/images/2020/06/Margherita-Pizza-scaled.jpg"
)

Recipe.create!(
  name: "Spaghetti Carbonara",
  description: "Traditional Italian pasta with eggs, cheese, pancetta, and pepper.",
  rating: 5,
  image_url: "https://maryberryrecipes.co.uk/wp-content/uploads/2025/02/Mary-Berry-Spaghetti-Carbonara-840x473.jpg"
)

Recipe.create!(
  name: "Chicken Tikka Masala",
  description: "Tender chicken pieces in a creamy spiced tomato sauce.",
  rating: 4.8,
  image_url: "https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/chickentikkamasala_67780_16x9.jpg"
)

Recipe.create!(
  name: "Vegetable Stir Fry",
  description: "A quick and healthy mix of fresh vegetables sautéed in soy sauce.",
  rating: 4.2,
  image_url: "https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/sachas_stir-fry_17077_16x9.jpg"
)

categories = ["Breakfast", "Pasta", "Seafood", "Dessert"]

categories.each do |category|
  url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category}"
  recipe_list = URI.parse(url).read
  recipes = JSON.parse(recipe_list)

  recipes["meals"].take(5).each do |recipe|
    id = recipe["idMeal"]
    recipe_builder(id)
  end
end