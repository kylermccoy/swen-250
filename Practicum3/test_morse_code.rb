require 'test/unit'
require_relative 'morse_code'

# Translate a word (letters) to Morse code. Returns the Morse code string
# (with a space between the codes for adjacent letters).
 
class MorseCodeTest < Test::Unit::TestCase

  def test_to_morse_nothing
    assert_equal "", to_morse("")
  end

  def test_to_morse_basic
    assert_equal ".-. .. - ", to_morse("RIT")
  end

  def test_to_morse_with_garbage
    assert_equal "... --- ... ", to_morse(" s o s! . -")
  end

  def test_from_morse_nothing
    assert_equal "", from_morse("")
  end

  def test_from_morse_simple
    assert_equal "RIT", from_morse(".-. .. - ")
  end

  def test_from_morse_with_garbage
    assert_equal "SOS", from_morse("... --- ... !ABC")
  end

  # Add your own tests here, but you may not edit the above tests.
  def test_from_more_with_test
    assert_equal "TEST", from_morse("- . ... - ! TEST")
  end
  
  def test_to_morse_with_test
    assert_equal "- . ... - ", to_morse("test")
  end

end
