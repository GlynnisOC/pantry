require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test

  def setup
    @cheese = Ingredient.new("Cheese", "oz", 50)
    @mac = Ingredient.new("Macaroni", "oz", 100)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_it_has_a_name
    assert_equal "Mac and Cheese", @mac_and_cheese.name
  end

  def test_it_starts_without_ingredients
    assert_equal ({}), @mac_and_cheese.ingredients_required
  end

  def test_it_contains_ingredients
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal ({@cheese => 2, @mac => 8}), @mac_and_cheese.ingredients_required
  end

  def test_it_returns_amount_required
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal 2, @mac_and_cheese.amount_required(@cheese)
    assert_equal 8, @mac_and_cheese.amount_required(@mac)
  end

  def test_it_returns_ingredients_list
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal [@cheese, @mac], @mac_and_cheese.ingredients
  end

  def test_it_returns_total_calories
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    @mac_and_cheese.ingredients_required
    assert_equal 440, @mac_and_cheese.total_calories
  end
  # The calories for each ingredient can be calculated by multiplying the
  # `calories` attribute of the Ingredient by the amount of the ingredient
  # required for the recipe.
end
