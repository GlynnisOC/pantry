class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end

  def enough_ingredients_for?(recipe)
    #go through the stock, check out how much of ingredient is available. Then
    #look into recipe and see how much is needed for that and it should not
    #be equal for the test to pass, until stock has been restocked.
    @stock.each do |ingredient, quantity|

  end
end
