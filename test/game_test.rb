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
    # # invalid response gets mock/stub
    # assert_equal "Invalid response. Please type either p or q.", @game.main_menu
    # # q input gets mock/stub
    # assert_equal "Goodbye", @game.main_menu
    @game.stubs(:gets).returns("P")
    assert_equal "Ok! Time to set up our boards!", @game.main_menu
  end
end
