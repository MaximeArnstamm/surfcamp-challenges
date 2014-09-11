require_relative 'cookbook'
require_relative 'view'
require_relative 'recipe'

require 'nokogiri'
require 'open-uri'

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

  def import
    ingredient = @view.get_ingredient

    page = open("http://www.marmiton.org/recettes/recherche.aspx?aqt=" + ingredient)
    doc = Nokogiri::HTML(page.read)
    doc.encoding = "utf-8"
    doc.search('.m_contenu_resultat').each do |element|
      name = element.search('.m_titre_resultat > a').inner_text
      puts name
      description = element.search('.m_texte_resultat').inner_text
      puts description
      @cookbook.add_recipe(Recipe.new(name: name, description: description))
    end
  end
end