require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class Celltest < Minitest::Test

  def setup
    @cell = Cell.new("B4")

    @cruiser = Ship.new("Cruiser", 3)

  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_it_has_coordinates
    assert_equal "B4", @cell.coordinate
  end

  def test_cell_does_not_have_ship
    assert_nil nil, @cell.ship
  end

  def test_cell_is_empty
    assert_equal true, @cell.empty?
  end


# pry(main)> cruiser = Ship.new("Cruiser", 3)
# # => #<Ship:0x00007f84f0891238...>
#
# pry(main)> cell.place_ship(cruiser)
#
# pry(main)> cell.ship
# # => #<Ship:0x00007f84f0891238...>
#
# pry(main)> cell.empty?
# # => false
end
