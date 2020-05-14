class Ship
  attr_reader :name,
              :health,
              :length

  def initialize(name, health)
    @name = name
    @health = health
    @length = health
  end

  def sunk?
    health == 0
  end

  def hit
    self.health -= 1
  end

  private
  attr_writer :health
end

# @ is available for anything in the class
# self.health avoids method creating its own local variable (remember scope)
# everything that comes below `private` will not be accessible outside of the class
