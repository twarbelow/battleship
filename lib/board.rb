require './lib/ship'
require './lib/cell'

class Board
  attr_reader :cells

  def initialize
    @cells = {A1: Cell.new("A1"),
              A2: Cell.new("A2"),
              A3: Cell.new("A3"),
              A4: Cell.new("A4"),
              B1: Cell.new("B1"),
              B2: Cell.new("B2"),
              B3: Cell.new("B3"),
              B4: Cell.new("B4"),
              C1: Cell.new("C1"),
              C2: Cell.new("C2"),
              C3: Cell.new("C3"),
              C4: Cell.new("C4"),
              D1: Cell.new("D1"),
              D2: Cell.new("D2"),
              D3: Cell.new("D3"),
              D4: Cell.new("D4")
    }
      # will need to refactor away from hardcoding cells if we make it to iteration 4
  end

  def valid_coordinates?(cell)
    @cells.key?(cell.to_sym)
  end

  def valid_placement?(type, placement)
    letters = placement.map { |element| element[0].ord }
    numbers = placement.map { |element| element[-1].to_i }
    sequential_letters = determine_relationship(letters) == :sequential
    sequential_numbers = determine_relationship(numbers) == :sequential
    same_letters = determine_relationship(letters) == :same
    same_numbers = determine_relationship(numbers) == :same

    if type.length != placement.count
      return false
    else
      return true if sequential_letters && same_numbers
      return true if same_letters && sequential_numbers
      return false
    end
  end

  def determine_relationship(array)
    sequential = 1
    same = 1

    count = 1
    while count < array.length
      if array[count] - array[count - 1] == 1
        count += 1
        sequential += 1
      elsif array[count] - array[count - 1] == 0
        count += 1
        same += 1
      else
        count += 1
      end
    end
    if sequential == array.length
      :sequential
    elsif same == array.length
      :same
    else
      false
    end
  end
end
