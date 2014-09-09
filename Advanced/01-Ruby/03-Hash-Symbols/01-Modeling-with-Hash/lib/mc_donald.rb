def poor_calories_counter(burger, side, beverage)
  #TODO: return number of calories for this mcDonald order
  menu = {
    "Cheese Burger" => 290,
    "Big Mac" => 300,
    "Mc Bacon" => 400,
    "Royal Cheese" => 130,
    "French fries" => 130,
    "Potatoes" => 130,
    "Coca" => 160,
    "Sprite" => 170
  }

  menu[burger] + menu[side] + menu[beverage]
end

def calories_counter(*orders)
  #TODO: return number of calories for a less constrained order
  menu = {
    "Cheese Burger" => 290,
    "Big Mac" => 300,
    "Mc Bacon" => 400,
    "Royal Cheese" => 130,
    "French fries" => 130,
    "Potatoes" => 130,
    "Coca" => 160,
    "Sprite" => 170
  }

  menu["Happy Meal"] = poor_calories_counter("Cheese Burger", "French fries", "Coca")
  menu["Best Of Big Mac"] = poor_calories_counter("Big Mac", "French fries", "Coca")
  menu["Best Of Royal Cheese"] = poor_calories_counter("Royal Cheese", "Potatoes", "Sprite")

  orders.reduce(0) { |sum, order| sum + menu[order] }
end
