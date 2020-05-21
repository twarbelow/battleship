require './lib/game'

class Turn
  attr_reader :human,
              :computer,
              :human_ship_count,
              :computer_ship_count

  def initialize(human, computer)
    @human = human
    @computer = computer
    @human_ship_count = 0
    @computer_ship_count = 0
  end

  def display_boards
    puts "==============COMPUTER BOARD=============="
    puts computer.board.render
    puts "==============PLAYER BOARD=============="
    puts human.board.render(true)
  end

  def player_turn(human)
    p "Enter the coordinate for your shot."
    human_input = gets.chomp.upcase
    if computer.board.valid_coordinates?(human_input) == true
      computer.board.cells[human_input].fire_upon
      if computer.board.cells[human_input].render(true) == "M"
        p "Your shot on #{human_input} was a miss."
      elsif computer.board.cells[human_input].render(true) == "H"
        p "Your shot on #{human_input} was a hit."
      elsif computer.board.cells[human_input].render(true) == "X"
        p "Your shot sunk my #{computer.board.cells[human_input].ship.name}!"
        @computer_ship_count += 1
      end
    end
    p "Please enter a valid coordinate."
    end
  end


  def computer_turn(computer)
    computer_input = human.board.cells.keys.sample
    if human.board.valid_coordinates?(computer_input) == true
      human.board.cells[computer_input].fire_upon
      if human.board.cells[computer_input].render(true) == "M"
        p "Computer shot on #{computer_input} was a miss."
      elsif human.board.cells[computer_input].render(true) == "H"
        p "Computer shot on #{computer_input} was a hit."
      elsif human.board.cells[computer_input].render(true) == "X"
        p "Computer shot on #{computer_input} sunk your #{human.board.cells[computer_input].ship.name}!"
        @human_ship_count += 1
      end
    end
  end
end
