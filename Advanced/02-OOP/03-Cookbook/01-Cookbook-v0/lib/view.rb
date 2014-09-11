require_relative "recipe"

class View
  def print_recipes(recipes)
    recipes.each { |_, recipe| puts "[#{recipe.id}] #{recipe.name} : #{recipe.description}" }
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
end