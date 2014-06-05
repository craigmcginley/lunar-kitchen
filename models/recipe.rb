class Recipe
  attr_accessor :name, :id, :instructions, :description

  def self.all
    temp = []
    recipes = []
    connection = PG.connect(dbname: 'recipe_box')
    temp = connection.exec("SELECT recipes.name, recipes.id, recipes.instructions, recipes.description FROM recipes")
    connection.close

    temp.each do |recipe|
      recipes << Recipe.new(recipe["name"], recipe["id"], recipe["instructions"], recipe["description"])
    end

    recipes
  end

    def self.find(id)
      recipes = self.all
      recipes.each do |recipe|
        if recipe.id = id
          return recipe
        end
      end
    end

  def initialize(name, id, instructions, description)
    @name = name
    @id = id
    @instructions = instructions
    @description = description
  end

  def ingredients
    ingredients = Ingredient.all
    recipe_ingredients = []
    ingredients.each do |ingredient|
      if ingredient.recipe_id == id
        recipe_ingredients << ingredient
      end
    end
    recipe_ingredients
  end

end


