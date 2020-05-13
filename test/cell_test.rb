require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test
  class BasicTest < CellTest
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

    def test_can_place_ship
      @cell.place_ship(@cruiser)

      assert_equal @cruiser, @cell.ship
    end

    def test_placing_ship_changes_empty
      @cell.place_ship(@cruiser)

      assert_equal false, @cell.empty?
    end

    def test_fired_upon_affects_cell_and_ship
      @cell.place_ship(@cruiser)
      assert_equal false, @cell.fired_upon?

      @cell.place_ship(@cruiser)
      @cell.fire_upon
      assert_equal 2, @cell.ship.health
      assert_equal true, @cell.fired_upon?
    end
  end

  class RenderTest < CellTest
    def setup
      @cell_1 = Cell.new("B4")
      @cell_2 = Cell.new("C3")

      @cruiser = Ship.new("Cruiser", 3)
    end

    def test_shipless_cell_renders_properly
      assert_equal ".", @cell_1.render

      @cell_1.fire_upon

      assert_equal "M", @cell_1.render
    end

    def test_cell_with_ship_renders_properly
      @cell_2.place_ship(@cruiser)
      assert_equal ".", @cell_2.render

      assert_equal "S", @cell_2.render(true)

      @cell_2.fire_upon
      assert_equal "H", @cell_2.render
      assert_equal false, @cruiser.sunk?

      @cruiser.hit
      @cruiser.hit
      assert_equal true, @cruiser.sunk?
      assert_equal "X", @cell_2.render
    end
  end
end
