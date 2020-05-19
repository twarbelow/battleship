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

      human.cruiser_place
      human.submarine.place

      computer.cruiser_place
      computer.submarine_place

      turn(computer, human)
    end
  end

  def display_boards(computer, human)

  end



end
