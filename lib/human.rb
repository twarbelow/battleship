class Human
  attr_reader :board,
              :cruiser,
              :submarine

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def place_cruiser
    loop do
      puts "Enter the squares for the cruiser (3 spaces). Please do it in this format: B1, B2, B3."
      cruiser_coords = gets.chomp.upcase.gsub(',', '').split
      if board.valid_placement?(cruiser, cruiser_coords) == true
        require 'pry'; binding.pry
        @board.place(cruiser, cruiser_coords)
        break
      end
      puts "Those are invalid coordinates. Please try again:"
    end
  end

  def place_submarine
    loop do
      puts "Enter the squares for the submarine (2 spaces):"
      input = gets.chomp
      submarine_coords = input.split(" ")
      if board.valid_placement?(submarine, submarine_coords) == true
        @board.place(submarine, submarine_coords)
        break
      end
      puts "Those are invalid coordinates. Please try again:"
    end
  end
end
