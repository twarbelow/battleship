require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/human'
require './lib/computer'
require './lib/board'
require './lib/cell'
require './lib/ship'

class TurnTest < Minitest::Test
  def setup
    @human = Human.new
    @computer = Computer.new
    @turn = Turn.new(@human, @computer)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_can_display_boards
    computer_board_message = "==============COMPUTER BOARD=============="
    player_board_message = "==============PLAYER BOARD=============="
    rendered_empty = " 1 2 3 4 \nA . . . .\nB . . . .\nC . . . .\nD . . . .\n"
    assert_equal (computer_board_message + rendered_empty + player_board_message + rendered_empty), @turn.display_boards(@human, @computer)
  end
end
