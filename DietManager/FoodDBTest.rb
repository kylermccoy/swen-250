require 'minitest/autorun'          #We need Ruby's unit testing library
require './FoodDB'

class FoodDBTest < MiniTest::Test
  def setup							#setup method is run automatically before each test_xxx
    @fdb = FoodDB.new("FoodDB.txt")
  end
  
  #Tests if there are entries in the DB after FoodDB.txt is read
  def test_DB_initialization
    assert(@fdb.size > 0, "Database entries not correctly read in")
  end
  
  #Tests the 'contains_food?' method of FoodDB
  def test_contains_food
    assert_equal true, @fdb.contains_food?("Orange"), "Database contains food Orange!"
  end
  
  #Tests the 'contains_recipe?' method of FoodDB
  def test_contains_recipe
    assert_equal true, @fdb.contains_recipe?("Chicken Sandwich"), "Database contains recipe Chicken Sandwich!"  
  end
  
  #Tests the 'contains?' method of FoodDB
  def test_contains
    assert_equal true, @fdb.contains?("Wheat Bread"), "Database contains Wheat Bread as a food!"
  end
  
  #Tests the 'get_food' method of FoodDB
  def test_get_food
    food = BasicFood.new("Orange", 67)
    assert_equal food.name, @fdb.get_food("Orange").name , "Should have returned BasicFood Orange 67!"
  end
  
  #Tests the 'get_recipe' method of FoodDB
  def test_get_recipe
    bread = BasicFood.new("Bread Slice", 80)
    chicken = BasicFood.new("Chicken", 245)
    rec = Recipe.new("Chicken Sandwich", [bread, bread, chicken])
    assert_equal rec.name, @fdb.get_recipe("Chicken Sandwich").name, "Should have returned Recipe Chicken Sandwich!"
  end
  
  #Tests the 'get' method of FoodDB
  def test_get
    food = BasicFood.new("Jelly", 155)
    assert_equal food.name, @fdb.get("Jelly").name, "Should have returned BasicFood Jelly!"
  end
  
  #Tests the 'find_matches' method of FoodDB
  def test_find_matches
    test = [BasicFood.new("Apple", 50)]
    assert_equal test[0].name, @fdb.find_matches("App")[0].name, "Should have received list with BasicFood Apple!"        
  end
  
  #Tests the 'add_basicFood' method
  def test_add_food
    @fdb.add_basicFood("Beans", 69)
    assert_equal true, @fdb.contains?("Beans"), "Didn't add BasicFood Beans to database!" 
  end
  
  #Tests the 'add_recipe' method
  def test_add_recipe
    @fdb.add_basicFood("Beans", 69)
    @fdb.add_recipe("PB&Beans Sandwich", ["Beans", "Peanut Butter", "Bread Slice"])
    assert_equal true, @fdb.contains?("PB&Beans Sandwich"), "Didn't add Recipe PB&Beans Sandwich to database!"
  end
  
  #Tests the addition of a Recipe with a Recipe as one of its ingredients
  def test_recipe_within_recipe
    @fdb.add_basicFood("Beans", 69)
    @fdb.add_recipe("PB&Beans Sandwich", ["Beans", "Peanut Butter", "Bread Slice"])
    @fdb.add_recipe("PB&Beans&Apple Sandwich", ["PB&Beans Sandwich", "Apple"])
    assert_equal true, @fdb.contains?("PB&Beans&Apple Sandwich"), "Didn't add Recipe PB&Beans&Apple Sandwich!"
  end
end
