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

  def display_boards(computer, human)
    puts "==============COMPUTER BOARD=============="
    puts computer.board.render
    puts "==============PLAYER BOARD=============="
    puts player.board.render(true)
  end

  def player_turn(player)
    loop do
      puts "Enter the coordinate for your shot."
      player_input = gets.chomp
      if computer.board.valid_coordinate?(player_input) == true
        computer.board.cells[player_input].fire_upon
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
      puts "Please enter a valid coordinate."
    end


    def computer_turn(computer)
      computer_input = player.board.cells.keys.sample
      if player.board.valid_coordinate?(computer_input) == true
        player.board.cells[computer_input].fire_upon
        if player.board.cells[computer_input].render(true) == "M"
          puts "Computer shot on #{computer_input} was a miss."
        elsif player.board.cells[computer_input].render(true) == "H"
          puts "Computer shot on #{computer_input} was a hit."
        elsif player.board.cells[computer_input].render(true) == "X"
          puts "Computer shot on #{computer_input} sunk your #{player.board.cells.ship.name}!"
          @human_ship_count += 1
        end
      end
    end
  end
end
