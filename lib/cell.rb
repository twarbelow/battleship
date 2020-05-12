class Cell
  attr_reader :coordinate,
              :ship,
              :cell_status

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @cell_status = true
  end


  def empty?
    @cell_status
  end

  def place_ship(ship)
    @cell_status = false
    @ship = ship
  end

  def fired_upon?
    @status = t
  end
end
