require_relative 'rectangle'
require 'minitest/autorun'

class RectangleTest < MiniTest::Test

	def test_width
		p1 = Point.new(0.0,0.0)
		p2 = Point.new(6.0,4.0)
		test = Rectangle.new(p1,p2)
		assert_equal 6, test.width, "Width should be 6!" 
	end

	def test_height
		p1 = Point.new(0.0,0.0)
                p2 = Point.new(6.0,4.0)
                test = Rectangle.new(p1,p2)
                assert_equal 4, test.height, "Height should be 4!"
	end

	def test_perimeter
		p1 = Point.new(0.0,0.0)
                p2 = Point.new(6.0,4.0)
                test = Rectangle.new(p1,p2)
                assert_equal 20, test.perimeter, "Perimeter should be 20!"
	end

	def test_area
		p1 = Point.new(0.0,0.0)
                p2 = Point.new(6.0,4.0)
                test = Rectangle.new(p1,p2)
                assert_equal 24, test.area, "Area should be 24!"
	end
end
