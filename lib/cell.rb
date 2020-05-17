class Cell
  attr_reader :coordinate,
              :ship,
              :empty

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @empty = true
    @is_fired_upon = false
  end

  def render(ship_place = false)
    if !empty? && fired_upon? && @ship.sunk?
      @render = "X"
    elsif !empty? && fired_upon?
      @render = "H"
    elsif !empty? && !fired_upon? && ship_place == true
      @render = "S"
    elsif empty? && fired_upon?
      @render = "M"
    elsif !fired_upon?
      @render = "."
    end
  end

  def empty?
    @ship == nil
  end

  def place_ship(name_of_ship)
    @empty = false
    @ship = name_of_ship
  end

  def fired_upon?
    @is_fired_upon
  end

  def fire_upon
    @is_fired_upon = true
    if !empty?
      @ship.hit
    end
    render
  end
end
