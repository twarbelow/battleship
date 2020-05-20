require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/human'

class HumanTest < Minitest::Test

  def setup
    @human = Human.new
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Human, @human
  end

  def test_it_starts_with_a_board_and_ships
    @human = Human.new

    assert_instance_of Board, @human.board
    assert_instance_of Ship, @human.cruiser
    assert_instance_of Ship, @human.submarine
  end

  def test_human_can_place_cruiser
    skip
    # needs stub for gets in place_cruiser
    @human.stubs(:gets).returns("a1, B1, C1")
    assert_equal true, @board.place_cruiser
    invalid_input = "Those are invalid coordinates. Please try again:"
    @human.stubs(:gets).returns("A1, B1, D1")
    assert_equal invalid_input, @board.place_cruiser
  end

  def test_human_can_place_submarine
    skip
    # needs stub for gets in place_submarine

    assert_equal true, @board.place_submarine
    invalid_input = "Those are invalid coordinates. Please try again:"
    assert_equal invalid_input, @board.place_submarine
  end




end
