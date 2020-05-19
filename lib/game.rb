require '.lib/ship'
require '.lib/cell'
require '.lib/board'
require '.lib/human'
require '.lib/computer'

class Game

  def start

    human = Human.new
    computer = Computer.new

    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."

    input = gets.chomp.downcase
    if input == "p"
      puts "I have laid out my ships on the grid."
      puts "You now need to lay out your ships."
      puts "The Cruiser is three units long and the Submarine is two units long."
      puts "  1 2 3 4"
      puts "A . . . ."
      puts "B . . . ."
      puts "C . . . ."
      puts "D . . . ."

      human.place_cruiser
      human.place.submarine

      computer.place_cruiser
      computer.place_submarine

      turn(computer, human)
    end
  end

  def display_boards(computer, human)
    puts "==============COMPUTER BOARD=============="
    puts computer.board.render
    puts "==============PLAYER BOARD=============="
    puts player.board.render(true)
  end

  def turn(computer, player)
    16.times do
      display_boards(computer, player)

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
          end
          break
        end
        puts "Please enter a valid coordinate."
      end



      computer_input = player.board.cells.keys.sample
      if player.board.valid_coordinate?(computer_input) == true
        player.board.cells[computer_input].fire_upon
        if player.board.cells[computer_input].render(true) == "M"
          puts "Computer shot on #{computer_input} was a miss."
        elsif player.board.cells[computer_input].render(true) == "H"
          puts "Computer shot on #{computer_input} was a hit."
        elsif player.board.cells[computer_input].render(true) == "X"
          puts "Computer shot on #{computer_input} sunk your #{player.board.cells.ship.name}!"
        end
      end
    end
  end
end
