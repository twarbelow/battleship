class Cell
  attr_reader :coordinate,
              :ship,
              :empty,
              :false,
              :spent

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @empty = true
    @spent = false
  end


  def empty?
    @empty
  end

  def place_ship(name_of_ship)
    @empty = false
    @ship = name_of_ship
  end

  def fired_upon?
    spent
  end

  def fire_upon
    @spent = true
    ship.hit
  end

end

# changed cell_status to empty
# create fired_upon?
# create fire_upon
# change argument in line 20 from ship to name_of_ship to make line 22 more readable 
