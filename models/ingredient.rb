class Ingredient
  attr_accessor :name, :recipe_id

  def self.all
    temp = []
    ingredients = []
    connection = PG.connect(dbname: 'recipe_box')
    temp = connection.exec("SELECT ingredients.name, ingredients.recipe_id FROM ingredients")
    connection.close

    temp.each do |ingredient|
      ingredients << Ingredient.new(ingredient["name"], ingredient["recipe_id"])
    end

    ingredients
  end

  def initialize(name, recipe_id)
    @name = name
    @recipe_id = recipe_id
  end
end
