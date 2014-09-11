require "csv"
require_relative "recipe"

class Cookbook
  def initialize(csv_path)
    @id = -1 # les tests commencent leurs id à 0
    @csv_path = csv_path
    read_from_file
  end

  def add_recipe(recipe)
    id = next_id
    recipe.id = id
    @recipes[id] = recipe
    write_to_file
  end

  def remove_recipe(recipe_id)
    @recipes.delete(recipe_id)
    write_to_file
  end

  # je tiens pas à me faire chier avec un array :p
  def recipes
    @recipes.values
  end

  private

  def next_id
    @id += 1
  end

  def read_from_file
    @recipes = {}
    CSV.foreach(@csv_path) do |row|
      id = next_id
      @recipes[id] = Recipe.new(name: row[0], description: row[1], id: id)
    end
  end

  def write_to_file
    CSV.open(@csv_path, "wb") do |csv|
      @recipes.each do |_, recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
