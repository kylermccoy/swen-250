require_relative 'line'
require 'minitest/autorun'

class LineTest < MiniTest::Test

  def test_length
    p1 = Point.new(0.0,4.0)
    p2 = Point.new(0.0,0.0)
    test = Line.new(p1,p2)
    assert_equal 4, test.length, "Length should be 4!" 
  end

  def test_negative
    p1 = Point.new(-4.0,-4.0)
    p2 = Point.new(-2.0,-4.0)
    test = Line.new(p1,p2)
    assert_equal 2, test.length, "Length should be 2!"
  end

  def test_zero
    p1 = Point.new
    p2 = Point.new
    test = Line.new(p1,p2)
    assert_equal 0, test.length, "Length should be 0!"
  end
 
end
