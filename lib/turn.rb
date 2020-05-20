require './lib/game'

class Turn
  attr_reader :computer,
              :human,
              :human_ship_count,
              :computer_ship_count

  def initialize(computer, human)
    @computer = computer
    @human = human
    @human_ship_count = 0
    @computer_ship_count = 0
  end

  def display_boards(computer, human)
    puts "==============COMPUTER BOARD=============="
    puts computer.board.render
    puts "==============PLAYER BOARD=============="
    puts human.board.render(true)
  end

  def player_turn(human)
    loop do
      puts "Enter the coordinate for your shot."
      player_input = gets.chomp
      if computer.board.valid_coordinate?(player_input) == true
        if computer.board.cells[player_input].fired_upon? == false
          @computer.board.cells[player_input].fire_upon
          if computer.board.cells[player_input].render(true) == "M"
            puts "Your shot on #{player_input} was a miss."
          elsif computer.board.cells[player_input].render(true) == "H"
            puts "Your shot on #{player_input} was a hit."
          elsif computer.board.cells[player_input].render(true) == "X"
            puts "Your shot sunk my #{computer.board.cells.ship.name}!"
            @computer_ship_count += 1
          end
          break
        end
      end
      puts "Please enter a valid coordinate."
    end
  end

  def computer_turn(computer)
    computer_input = human.board.cells.keys.sample
    until human.board.valid_coordinates?(computer_input) &&
    human.board.cells[computer_input].fired_upon? == false
      computer_input = human.board.cells.keys.sample
    end
    @human.board.cells[computer_input].fire_upon
    if human.board.cells[computer_input].render(true) == "M"
      puts "Computer shot on #{computer_input} was a miss."
    elsif human.board.cells[computer_input].render(true) == "H"
      puts "Computer shot on #{computer_input} was a hit."
    elsif human.board.cells[computer_input].render(true) == "X"
      puts "Computer shot on #{computer_input} sunk your #{human.board.cells.ship.name}!"
      @human_ship_count += 1
    end
  end
end
