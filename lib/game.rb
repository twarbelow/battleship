require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/human'
require './lib/computer'
require './lib/turn'

class Game


  def start
    main_menu

    p "I have laid out my ships on the grid."
    p "You now need to lay out your ships."
    p "The Cruiser is three units long and the Submarine is two units long."

    p "  1 2 3 4"
    p "A . . . ."
    p "B . . . ."
    p "C . . . ."
    p "D . . . ."
    # should all these puts be human.board.render ??

    self.human_setup

    self.computer_setup

    play
  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
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
    p response_options[input]
  end

  def valid_input?(input)
    ["p", "q"].include?(input)
  end

  def response_options
    {"p" => "Ok! Time to set up our boards!", "q" => "Maybe next time! Goodbye."}
  end

  def human_setup
    human.place_cruiser
    human.place.submarine
  end

  def computer_setup
    computer.place_cruiser
    computer.place_submarine
  end

  def play
    loop do
      turn = Turn.new(computer, human)
      turn.display_boards(computer, human)
      turn.player_turn(human)
      turn.computer_turn(computer)
      @computer_ship_count += turn.computer_ship_count
      @human_ship_count += turn.human_ship_count
      if computer_loses
        puts "You won!"
        turn.display_boards(computer, human)
      elsif human_loses
        turn.display_boards(computer, human)
        puts "I won!"
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

# Optional To-Do:
# could make printer class to handle all terminal output

# would like to refactor so main_menu essentially reads:
# greet_user
# check_validity
# p display_options[input]
# not sure how to do this because of the input required..would have to store and reassign somewhere
