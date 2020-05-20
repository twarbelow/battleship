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
    # would like to be able to test invalid response but run into infinite loop
    @human.stubs(:gets).returns("a1, B1, C1")
    assert_equal "placed", @human.place_cruiser
  end

  def test_human_can_place_submarine
    # would like to be able to test invalid response but run into infinite loop
    @human.stubs(:gets).returns("d2, d3")
    assert_equal "placed", @human.place_submarine

  end




end
