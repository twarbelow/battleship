require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
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
    # the invalid input test will not complete due to the abort in the code
    # wondering if there is a way around this
    # @game.stubs(:gets).returns("boogie")
    # assert_equal "Invalid response. Please type either p or q.", @game.main_menu
    @game.stubs(:gets).returns("Q")
    assert_equal "Maybe next time! Goodbye.", @game.main_menu
    @game.stubs(:gets).returns("P")
    assert_equal "Ok! Time to set up our boards!", @game.main_menu
  end
end
