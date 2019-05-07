# Unit tests for student developed tests

require_relative 'concordance'
require 'minitest/autorun'          #We need Ruby's unit testing library

class ConcordanceTest < MiniTest::Test

  # Remember: this gets run prior to each individual test_* method
  def setup
    @concordance = Concordance.new
  end

  # Fill in these tests as described

  # Create a test for the clean method that confirms that one or more '@' signs
  #   are replaced with space characters. Use the input string 'test@@one@two'
  def test_clean_at_sign
    test = "test@@one@two"
    assert_equal "test  one two",@concordance.clean(test), "Failed to remove @ symbols with spaces!"
  end

  # Create a test for the get_words method that correctly handles lots of spaces.
  #    Use this string:
  #    '   seven    seventy    seven  '
  def test_get_words_many_spaces
    test = "   seven    seventy    seven  "
    assert_equal ["seven","seventy","seven"], @concordance.get_words(test), "Failed to remove extra spaces!"
  end

  # Create a test for the index! method that confirms that a line with just one repeated word is only listed
  #   once in the hash table. Call the .index! method with this array ['zero', 'zero', 'zero']
  def test_index_one_repeated_word
    arr = ["zero","zero","zero"]
    @concordance.index!(arr)
    assert_equal [1], @concordance.hash["zero"], "Concordance value for 'zero' is not [1]!"
  end

end
