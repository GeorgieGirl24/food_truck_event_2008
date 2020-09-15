require 'minitest/autorun'
require 'minitest/pride'
require './lib/food_truck'
require './lib/item'

class FoodTruckTest < Minitest::Test
  def test_it_exists
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    assert_instance_of FoodTruck, food_truck
  end

  def test_it_has_attributes
    # skip
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    assert_equal "Rocky Mountain Pies", food_truck.name
  end

  def test_it_starts_with_no_inventory
    # skip
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expected = {}
    assert_equal expected, food_truck.inventory
  end

  def test_it_can_check_it_will_return_0_when_there_is_no_stock
    # skip
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    assert_equal 0, food_truck.check_stock(item1)
  end

  def test_it_can_stock_the_inventory
    # skip
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    food_truck.stock(item1, 30)

    expected = {item1 => 30}
    unexpected = {item1 => 40}
    assert_equal expected, food_truck.inventory
    refute_equal unexpected, food_truck.inventory
  end

  def test_it_can_check_inventory_when_items_are_stocked
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    food_truck.stock(item1, 30)
    assert_equal 30, food_truck.check_stock(item1)
    food_truck.stock(item1, 25)
    expected = {item1 => 55}
    assert_equal expected, food_truck.inventory
    assert_equal 55, food_truck.check_stock(item1)
  end

  def test_it_can_add_different_items_to_inventory
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    food_truck.stock(item1, 30)
    food_truck.stock(item1, 25)
    food_truck.stock(item2, 12)

    expected = expected = {item1 => 55, item2 => 12}
    assert_equal expected, food_truck.inventory
  end
end
