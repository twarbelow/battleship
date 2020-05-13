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

  def render
    if spent == false
      @render
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
    # means this stuff
    # if @ship != nil
    #   ship.hit
    # end
    render
  end

end

# what I worked
# changed cell_status to empty
# create fired_upon?
# create fire_upon
# change argument in line 20 from ship to name_of_ship
  # to make line 22 more readable
# add render to initialize and reader


# state: some of our methods are directly dependent upon a set of conditions,
  # logic exists in two places which means you can have 2 different versions
  # witch means you can have bugs
