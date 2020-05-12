class Cell
  attr_reader :coordinate,
              :status

  def initialize(coordinate)
    @coordinate = coordinate
    @status = "empty"
  end

  def ship

  end

# might want to change this later. make sure it evalues to boolean
  def empty?
    status == "empty"
  end

  def place_ship(ship)

  end

end
