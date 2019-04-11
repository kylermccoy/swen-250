require_relative 'circle'
require 'minitest/autorun'

class CircleTest < MiniTest::Test

	def test_diameter
		p1 = Point.new(0.0,0.0)
		p2 = Point.new(2.0,0.0)
		test = Circle.new(p1,p2)
		assert_equal 4, test.diameter, "Diameter should be 4!"
	end

	def test_circumference
		p1 = Point.new(0.0,0.0)
		p2 = Point.new(2.0,0.0)
		test = Circle.new(p1,p2)
		assert_equal 4*Math::PI, test.circumference, "Circumference should be 12.57!"
	end

	def test_area
		p1 = Point.new(0.0,0.0)
		p2 = Point.new(2.0,0.0)
		test = Circle.new(p1,p2)
		assert_equal 4*Math::PI, test.area, "Area should be 12.57!"
	end

end
