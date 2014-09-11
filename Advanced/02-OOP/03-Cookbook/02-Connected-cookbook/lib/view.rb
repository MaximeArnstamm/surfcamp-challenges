require_relative "recipe"

class View
  def print_recipes(recipes)
    recipes.each { |recipe| puts "[#{recipe.id}] #{recipe.name}\n -- #{recipe.description}" }
  end

  def get_recipe_name
    puts "What's the name of your new recipe ?"
    print "> "
    gets
  end

  def get_recipe_description
    puts "Enter the description of this recipe :"
    print "> "
    gets
  end

  def get_deletion_entry
    puts "What is the id of the recipe you want to delete ?"
    print "> "
    gets
  end

  def get_ingredient
    puts "What is the main ingredient for the search ?"
    print "> "
    gets
  end
end