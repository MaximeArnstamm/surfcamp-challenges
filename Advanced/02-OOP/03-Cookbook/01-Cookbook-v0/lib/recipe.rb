class Recipe
  attr_accessor :id, :name, :description

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @description = hash[:description]
  end
end