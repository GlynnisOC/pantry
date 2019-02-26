require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new
    @cheese = Ingredient.new("Cheese", "oz", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_its_stock_starts_as_empty_hash
    assert_equal ({}), @pantry.stock
  end

  def test_it_returns_zero_for_amount_of_cheese
    assert_equal 0, @pantry.stock_check(@cheese)
  end

  def test_it_shows_ingredient_as_stocked
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_it_returns_true_or_false_if_enough_ingredients_for_recipe
    @pantry.stock_check(@cheese)
    @pantry.stock_check(@mac)
    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)
  end
end
