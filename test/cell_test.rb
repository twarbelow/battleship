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

  def test_

  end
end
