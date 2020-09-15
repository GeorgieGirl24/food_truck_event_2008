class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    return 0 if @inventory.include?(item) == false
    @inventory.sum do |an_item, amount|
      amount
    end
  end

  def stock(item, amount)
    if @inventory[item].nil?
      @inventory[item] = amount
    else
      @inventory[item] += amount
    end
  end

  def cost_per_unit
    @inventory.map do |item, quantity|
      item.price
    end
  end

  def potential_revenue
    sum = 0
    @inventory.sum do |item, quantity|
      sum = item.price * quantity
    end
    sum
  end
end
