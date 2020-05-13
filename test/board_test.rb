require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test

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
