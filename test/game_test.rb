require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/human'
require './lib/computer'

class GameTest < Minitest::Test

  def setup
    @human = Human.new
    @computer = Computer.new
    @game = Game.new(@human, @computer)
  end

  def test_it_has_main_menu
    # # invalid response gets mock/stub
    # assert_equal "Invalid response. Please type either p or q.", @game.main_menu
    # # q input gets mock/stub
    # assert_equal "Goodbye", @game.main_menu
    @game.stub(:gets).returns("P")
    assert_equal "Ok! Time to set up our boards!", @game.main_menu
  end
end
