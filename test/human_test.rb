require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/human'

class HumanTest < Minitest::Test

  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end
  def test_it_exists
    human = Human.new

    assert_instance_of Human, human
  end



  def test_human_can_place_cruiser
    # take user inputs using mocks and place a ship, multiple
    # inputs may be needed
    # needs stub for gets in place_cruiser
    assert_equal true, @board.place_cruiser
    invalid_input = "Those are invalid coordinates. Please try again:"
    assert_equal invalid_input, @board.place_cruiser
  end

  def test_human_can_place_submarine
    # needs stub for gets in place_cruiser

  end




end
