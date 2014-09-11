require_relative 'cookbook'
require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    @view.print_recipes @cookbook.recipes
  end

  def create
    name = @view.get_recipe_name
    description = @view.get_recipe_description
    @cookbook.add_recipe(Recipe.new(name: name, description: description))
  end

  def destroy
    id = @view.get_deletion_entry
    @cookbook.remove_recipe id
  end
end