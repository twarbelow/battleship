require './lib/game'

computer = Computer.new
human = Human.new

game = Game.new(computer, human)
game.start
