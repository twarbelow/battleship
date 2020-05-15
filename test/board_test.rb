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
      assert_instance_of Cell, @board.cells[:A1]
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



    # def test_cells_must_be_consecutive
    #   assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    #   assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    #   assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    #   assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"])
    # end
  end


# To proceed past the above tests, work these patterns in these groupings:
# NEXT: make sure the coordinates are consecutive
#   pry(main)> board.valid_placement?(cruiser, ["A1", "A2", "A4"])
# # => false
#
# pry(main)> board.valid_placement?(submarine, ["A1", "C1"])
# # => false
#
# pry(main)> board.valid_placement?(cruiser, ["A3", "A2", "A1"])
# # => false
#
# pry(main)> board.valid_placement?(submarine, ["C1", "B1"])
# # => false

# THEN: coordinates can’t be diagonal
# pry(main)> board.valid_placement?(cruiser, ["A1", "B2", "C3"])
# # => false
#
# pry(main)> board.valid_placement?(submarine, ["C2", "D3"])
# # => false

# FINALLY: these 2 should pass
# pry(main)> board.valid_placement?(submarine, ["A1", "A2"])
# # => true
#
# pry(main)> board.valid_placement?(cruiser, ["B1", "C1", "D1"])
# # => true


end
