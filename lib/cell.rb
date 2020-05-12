class Cell
  attr_reader :coordinate,
              :status

  def initialize(coordinate)
    @coordinate = coordinate
    @status = nil
  end

# cell.ship is saying that there is no ship in play.
# Viewing the interaction pattern, it calls cell.ship and returns nil.
# So that means nothing.
# There is no instance and thus the cell.empty?  = true.
# test_it_does_not_exist_before_it_is_created
  # is this the same as test_cell_does_not_have_ship?
  def ship
    status
  end

# The empty method needs to return true when no ship is in it.
  def empty?
    status == nil
  end

  def place_ship(ship)
    @status = ship
  end

  def fired_upon?
    @status = t
  end
end
