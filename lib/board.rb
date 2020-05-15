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

    determine_relationship(letters)
    determine_relationship(numbers)
    type.length == placement.count && ((determine_relationship(letters) != determine_relationship(numbers)) || (determine_relationship(letters) != determine_relationship(numbers)))
  end

  def determine_relationship(array)
    count = 0
    while count < array.length
      if array[count + 1] - array[count] == 1
        count += 1
        return "sequential"
      elsif array[count + 1] - array[count] == 0
        count += 1
        return "same"
      else
        return false
      end
    end
  end
end

  # lets say we are just dealing with one array how do we evaluate its elements against each other?
  #   maybe we don't need to evaluate it against another array of consecutive options.
  #   compare first one to second one
  #     find out if first character matches first character or second character matches second character
  #       if and only if one of the matches return true then:
  #         compare second element to third element, checking the character that matched in the first comparison and making sure it also matches in the second comparison
  #
  #
  #
  #
  #   array = ["A1", "B1", "C1", "D1"]
  #


    # need to compare elements in order

    # Good plcaement is:
    # • All the same letter, and sequential numbers
    # • Sequential letters, and the same numbers
    #
    # becomes
    #
    # isLettersSame = lettersarray.uniq.length == 1
    # isLettersSequential = lettersarray enumerable do .ord
    # isNumbersSame = ... numbersarray.uniq.length == 1
    # isNumbersSequential = ...
    #
    # return true if isLettersSame && isNumbersSequential
    # return true if isLettersSequential && isNumbersSame
    # return false

    # take each element find out if letters are same (first character is same), or if second character is same
    #  if character 1 is constant
      # then is charact 2 consecutive
    # else is character 1 consequtive







  # end
    # if we have to use the same method, how do you filter for
    # new results? put an || at the end of the statement and
    # continue on the next line?
    #
    # using each_cons is the answer to the consecutive question
    # but i'm not sure of its syntax.
    # @cells.each_cons(3) {|x| p x } returns each cell which
    # could be part of 3 consecutive i.e. quite a few of them

    # looks like using the Range class might help with getting
    # ship placements to be valid




  # def render(ship_place = false)
  #   puts " 1 2 3 4 \n" +
  #   "A #{cells[:A1].render(ship_place)} #{cells[:A2].render(ship_place)} #{cells[:A3].render(ship_place)} #{cells[:A4].render(ship_place)} \n" +
  #   "B #{cells[:B1].render(ship_place)} #{cells[:B2].render(ship_place)} #{cells[:B3].render(ship_place)} #{cells[:B4].render(ship_place)} \n" +
  #   "A #{cells[:C1].render(ship_place)} #{cells[:C2].render(ship_place)} #{cells[:C3].render(ship_place)} #{cells[:C4].render(ship_place)} \n" +
  #   "A #{cells[:D1].render(ship_place)} #{cells[:D2].render(ship_place)} #{cells[:D3].render(ship_place)} #{cells[:D4].render(ship_place)} \n"
  # end
