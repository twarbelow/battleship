require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/human'
require './lib/computer'
require './lib/turn'

class Game
  attr_reader :computer,
              :human,
              :computer_ship_count,
              :human_ship_count

  def initialize(computer, human)
    @computer = computer
    @human = human
    @computer_ship_count = 0
    @human_ship_count = 0
  end

  def start
    main_menu

    p "I have laid out my ships on the grid."
    p "You now need to lay out your ships."
    p "The Cruiser is three units long and the Submarine is two units long."
    p "Here is what your board looks like right now:"
    puts human.board.render

    human_setup
    computer_setup

    play
  end

  def main_menu
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    input = gets.chomp.downcase
    invalid_input_count = 0
    until valid_input?(input)
      if invalid_input_count > 4
        abort "This isn't fun for me anymore. Goodbye!"
      end
      p "Invalid response. Please type either p or q."
      invalid_input_count += 1
      input = gets.chomp.downcase
    end
    if input == "q"
      abort(response_options[input])
    else
      p response_options[input]
    end
  end

  def valid_input?(input)
    ["p", "q"].include?(input)
  end

  def response_options
    {"p" => "Ok! Time to set up our boards!", "q" => "Maybe next time! Goodbye."}
  end

  def human_setup
    human.place_cruiser
    puts human.board.render(true)
    human.place_submarine
  end

  def computer_setup
    computer.place_cruiser
    computer.place_submarine
  end

  def play
    loop do

      turn = Turn.new(human, computer)
      turn.display_boards
      turn.player_turn(human)
      turn.computer_turn(computer)
      @computer_ship_count += turn.computer_ship_count
      @human_ship_count += turn.human_ship_count
      if computer_loses
        p "You won!"
        turn.display_boards
        break
      elsif human_loses
        turn.display_boards
        p "I won!"
        turn.display_boards(computer, human)
        break
      else
        next
      end
    end
    start
  end

  def computer_loses
    computer_ship_count == 2
  end

  def human_loses
    human_ship_count == 2
  end
end
