class Game


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
    # should all these puts be human.board.render ??

    human.place_cruiser
    human.place_submarine

    computer.place_cruiser
    computer.place_submarine

    turn(computer, human)
  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    # invalid_count = 0

    if gets.chomp.downcase == "p"
      p "Ok! Time to set up our boards!"
    elsif gets.chomp.downcase == "q"
      p "Maybe next time! Goodbye."
    # else
    #   if invalid_count < 5
    #     p "Invalid response. Please type either p or q."
    #     invalid_count += 1
    #     self.main_menu
    #   else
    #     abort ("This isn't fun for me anymore. Goodbye")
    #   end
    end
  end
