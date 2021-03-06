require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test
  class BasicTests < BoardTest
    def setup
      @board = Board.new

      @cruiser = Ship.new("Cruiser", 3)
      @submarine = Ship.new("Submarine", 2)
    end

    def test_it_exists
      assert_instance_of Board, @board
    end

    def test_it_has_cells
      assert_equal 16 , @board.cells.count
      assert_instance_of Cell, @board.cells["A1"]
    end

    def test_it_has_valid_coordinates?
      assert_equal true, @board.valid_coordinates?("A1")
      assert_equal true, @board.valid_coordinates?("D4")
      assert_equal false, @board.valid_coordinates?("A5")
      assert_equal false, @board.valid_coordinates?("E1")
      assert_equal false, @board.valid_coordinates?("A22")
    end
  end

  class ValidPlacementTests < BoardTest
    def setup
      @board = Board.new

      @cruiser = Ship.new("Cruiser", 3)
      @submarine = Ship.new("Submarine", 2)
    end

    def test_length_equal_to_placement_count
      assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
      assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
    end

    def test_characters_are_sequential?
      assert_equal false, @board.characters_are_sequential?(["A".ord, "A".ord, "A".ord])
      assert_equal false, @board.characters_are_sequential?(["A".ord, "B".ord, "A".ord])
      assert_equal false, @board.characters_are_sequential?([1, 3, 4])
      assert_equal false, @board.characters_are_sequential?([2, 2, 2])
      assert_equal true, @board.characters_are_sequential?(["B".ord, "C".ord, "D".ord])
      assert_equal true, @board.characters_are_sequential?([2, 3, 4])
    end

    def test_characters_are_same?
      assert_equal false, @board.characters_are_same?([1, 2, 3])
      assert_equal false, @board.characters_are_same?(["A".ord, "B".ord, "A".ord])
      assert_equal true, @board.characters_are_same?(["A".ord, "A".ord, "A".ord])
      assert_equal true, @board.characters_are_same?([2, 2, 2])
    end

    def test_cells_must_be_consecutive
      assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
      assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
      assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
      assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"])
      assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
    end

    def test_coordinates_cannot_be_diagonal
      assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
      assert_equal false, @board.valid_placement?(@submarine, ["C2", "D3"])
    end

    def test_is_has_valid_placement
      assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
      assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
    end
  end

  class ShipPlacementTests < BoardTest
    def setup
      @board = Board.new
      @cruiser = Ship.new("Cruiser", 3)
      @submarine = Ship.new("Submarine", 2)
      @cell_1 = @board.cells["A1"]
      @cell_2 = @board.cells["A2"]
      @cell_3 = @board.cells["A3"]
    end

    def test_ships_can_be_placed
      @board.place(@cruiser, ["A1", "A2", "A3"])


      assert_instance_of Ship, @cell_1.ship
      assert_instance_of Ship, @cell_2.ship
      assert_instance_of Ship, @cell_3.ship
      assert_equal @cell_3.ship, @cell_2.ship
    end

    def test_placement_is_available?
      assert_equal true, @board.placement_available?(["A1", "A2", "A3"])

      @board.place(@cruiser, ["A1", "A2", "A3"])

      assert_equal false, @board.placement_available?(["A1", "B1"])
    end

    def test_no_overlapping_ships
      @board.place(@cruiser, ["A1", "A2", "A3"])
      @board.place(@submarine, ["A1", "B1"])
      assert_equal false, @board.valid_placement?(@submarine, ["A1", "B1"])
    end

    def test_board_can_be_rendered
      expected = " 1 2 3 4 \nA . . . .\nB . . . .\nC . . . .\nD . . . .\n"
      expected_with_ship = " 1 2 3 4 \nA S S S .\nB . . . .\nC . . . .\nD . . . .\n"

      assert_equal expected, @board.render

      @board.place(@cruiser, ["A1", "A2", "A3"])

      assert_equal expected_with_ship, @board.render(true)
    end
  end
end
