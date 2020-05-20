class Game
  attr_reader :human,
              :computer

  def initialize(human, computer)
    @human = human
    @computer = computer
  end

  def start
    main_menu
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

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    invalid_count = 0

    if gets.chomp.downcase == "p"
      puts "Ok! Time to set up our boards!"
    elsif gets.chomp.downcase == "q"
      puts "Maybe next time, Goodbye"
    else
      if invalid_count < 5
        puts "Invalid response. Please type either p or q."
        invalid_count += 1
        self.main_menu
      else
        abort ("This isn't fun for me anymore. Goodbye")
      end
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
