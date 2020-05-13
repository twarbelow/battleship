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

# Additionally, we will include an optional boolean argument to
# indicate if we want to reveal a ship in the cell even if it has
# not been fired upon. This should render a cell that has not been
# fired upon and contains a ship as an “S”. This will be useful for
# showing the user where they placed their ships and for debugging.
  def render(thing = false)
    if thing == true
      @render = "S"
    elsif spent == false
      @render = "."
    elsif ship == nil
      @render = "M"
    elsif @ship.sunk? != true
      @render = "H"
    elsif  @ship.sunk? == true
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

# state: some of our methods are directly dependent upon a set of conditions,
  # logic exists in two places which means you can have 2 different versions
  # which means you can have bugs
