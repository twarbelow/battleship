require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
  end

  def test_it_has_main_menu
    expected = "Welcome to BATTLESHIP\n" "Enter p to play. Enter q to quit."
    assert_equal expected, @game.main_menu
  end
end
