require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class Shiptest < Minitest::Test

  def setup
    cruiser = Ship.new("Cruiser", 3)

  end

  def test_it_exists

  end

  def test_has_length


    assert_equal 3, ship.length
  end

  def test_it_has_health


    assert_equal 3, ship.health
  end

  def test_it_is_not_sunk_to_start


    assert_equal false, ship.sunk?
  end

  # def test_it_gets_hit
  #
  #
  #   ship.hit
  #   assert_equal false, ship.sunk?
  #   assert_equal 2, ship.health
  #
  # end

  def test_ship_gets_sunk


    ship.hit
    assert_equal 2, ship.health

    ship.hit
    assert_equal 1, ship.health
    assert_equal false, ship.sunk?

    ship.hit
    assert_equal 0, ship.health
    assert_equal true, ship.sunk?
  end

end
