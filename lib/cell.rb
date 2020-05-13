class Cell
  attr_reader :coordinate,
              :ship,
              :empty,
              :false,
              :spent,
              :render

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @empty = true
    @spent = false
    @render = "."
  end

  def render(ship_place = false)
    if ship_place == true
      @render = "S"
    elsif spent == false
      @render = "."
    elsif ship == nil
      @render = "M"
    elsif @ship.sunk? != true
      @render = "H"
    elsif @ship.sunk? == true
      @render = "X"
    end
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
    ship.hit unless @ship.nil?
    render
  end
end
