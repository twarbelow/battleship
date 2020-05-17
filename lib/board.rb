require './lib/ship'
require './lib/cell'

class Board
  attr_reader :cells

  def initialize
    @cells = {
              "A1" => Cell.new("A1"),
              "A2" => Cell.new("A2"),
              "A3" => Cell.new("A3"),
              "A4" => Cell.new("A4"),
              "B1" => Cell.new("B1"),
              "B2" => Cell.new("B2"),
              "B3" => Cell.new("B3"),
              "B4" => Cell.new("B4"),
              "C1" => Cell.new("C1"),
              "C2" => Cell.new("C2"),
              "C3" => Cell.new("C3"),
              "C4" => Cell.new("C4"),
              "D1" => Cell.new("D1"),
              "D2" => Cell.new("D2"),
              "D3" => Cell.new("D3"),
              "D4" => Cell.new("D4")
    }
      # will need to refactor away from hardcoding cells if we make it to iteration 4
  end

  def valid_coordinates?(cell)
    @cells.key?(cell)
  end

  def valid_placement?(type, placement)
    if placement_available?(placement) == false
      return false
      # this is becuase it returns a nil if the method doesn't do anything

    else
      letters = placement.map { |coordinate| coordinate[0].ord }
      numbers = placement.map { |coordinate| coordinate[-1].to_i }

      if type.length != placement.count
        return false
      else
        return true if characters_are_sequential?(letters) && characters_are_same?(numbers)
        return true if characters_are_same?(letters) && characters_are_sequential?(numbers)
        return false
      end
    end
  end

  def characters_are_sequential?(array)
    array.map.each_with_index do |number, index|
      next if index == 0
      number - array[index - 1] == 1
    end.compact.all? { |number| number == true}
  end

  def characters_are_same?(array)
    array.map.each_with_index do |number, index|
      next if index == 0
      number - array[index - 1] == 0
    end.compact.all? { |number| number == true}
  end

  def place(type, placement)
    valid_placement?(type, placement)


    placement.each do |coordinate|
      cells[coordinate].place_ship(type)
    end
  end

  def placement_available?(placement)
    placement.map do |coordinate|
      cells[coordinate].empty == true
    end.compact.all? { |coordinate| coordinate == true}
  end
end
