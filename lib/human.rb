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
      p "Enter the squares for the cruiser (3 spaces). Please do it in this format: B1, B2, B3"
      cruiser_coords = gets.chomp.upcase.gsub(',', '').split
      # the cruiser_coords doesn't work for a bunch of user errors
      # below is a hilarious way to do the above in a different order that kind of solved one user error
      # don't know how to fix other user errors
      # cruiser_coords = gets.chomp.upcase.split(",").map { |coordinate| coordinate.gsub(',', '')}
      if board.valid_placement?(cruiser, cruiser_coords) == true
        @board.place(cruiser, cruiser_coords)
        break("placed")
      end
      p "Those are invalid coordinates. Please try again:"
    end
  end

  def place_submarine
    loop do
      p "Enter the squares for the submarine (2 spaces). Please do it in this format: C3, D3"
      submarine_coords = gets.chomp.upcase.gsub(',', '').split
      if board.valid_placement?(submarine, submarine_coords) == true
        @board.place(submarine, submarine_coords)
        break("placed")
      end
      p "Those are invalid coordinates. Please try again:"
    end
  end
end
