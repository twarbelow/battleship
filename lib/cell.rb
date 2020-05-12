class Cell
  attr_reader :coordinate,
              :status

  def initialize(coordinate)
    @coordinate = coordinate
    @status = nil
  end

  def ship

  end

  def empty?
    status == nil
  end

  # def place_ship(ship)
  #   @status = ship
  # end

end
