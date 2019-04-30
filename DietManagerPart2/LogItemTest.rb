require 'minitest/autorun'          #We need Ruby's unit testing library
require_relative './LogItem'

class LogItemTest < MiniTest::Test
  def setup
    @item = LogItem.new("Orange", Date.today)
  end
  
  #Tests the basic construction of a LogItem object
  def test_construction
    assert_equal @item.name, "Orange", "The LogItem's name should be Orange!"
  end
  
  #Tests the 'to_s' method of LogItem
  def test_to_s
    date = Date.today
    date_tokens = date.to_s.split("-")
    date_string = "#{date_tokens[1]}/#{date_tokens[2]}/#{date_tokens[0]}"
    test = "#{date_string}, Orange"
    assert_equal test, @item.to_s, "The LogItem print doesn't match!"
  end
  
end
