
class Concordance

  attr_reader :hash,:line_number

  def initialize
    ### FILL IN ANY CODE YOU MAY NEED HERE
    #keep track of line number
    @line_number = 1
    # This is will create an instance variable called @hash that that starts
    # with an empty array when the key doesn't exist. No need to modify this.
    @hash = Hash.new { |h, k| h[k] = [] }
  end

  # Add a single line of text to the concordance.
  #
  # Delegates all functionality to other methods to clean, split, and index
  # according to the line.
  #
  # Modifies the concordance, hence the bang in the method name.
  #
  # THIS METHOD NEEDS NO MODIFICATION
  #
  def process!(line)
    index!(get_words(clean(line)))
  end

  # Clean the string in preparation for splitting and indexing
  #
  # The line should be converted to lower case letters
  # All non-letter characters should be replaced with a space
  #
  # returns a string of only lowercase letters and spaces
  #
  def clean(line)
    ### FILL IN YOUR CODE HERE
    #lower case line
    lower = line.downcase
    #sub out no letter characters to space
    subbed = lower.gsub(/[^a-zA-Z\s]/," ")
    return subbed
  end

  # Convert the string of cleaned words into an array of words
  #
  # Multiple consecutive spaces should be treated as one
  # No empty strings in the array.
  #
  # returns an array of words
  #
  def get_words(line)
    ### FILL IN YOUR CODE HERE
    #split string by spaces
    arr = line.split(" ")
    #remove empty strings
    arr.each { |word|
      if word == " "
        arr.delete(word)
      end
    }
    return arr
  end

  # Tally up line of words in the concordance dictionary for the current line
  #
  # If a word occurs multiple times in one line, the line number should not
  # occur more than once.
  #
  # Increment an instance variable that keeps track of the current line
  #
  # returns nothing, but @hash is populated with another line of text
  #
  def index!(words)
    ### FILL IN YOUR CODE HERE
    #line count
    line_count = @line_number
    words.each { |word|
      #if word already in hash
      if @hash.has_key?(word)
        #if line_count isn't already in array
        if !@hash[word].include?(line_count)
          @hash[word] << line_count
        end
      #if word isn't in hash
      else
        @hash[word] << line_count
      end
    }
    @line_number += 1
  end

  # Return a string of the concordance dictionary formatted prettily
  #
  # The concordance should be sorted by word, and with comma-separated integers
  # on each line. The line numbers should be sorted in ascending order as well.
  # For example,
  #
  #   apples: 4,5,6
  #   bananas: 5,8,9
  # (no indentation)
  #
  # HINT: the 'join' method on Array might be helpful.
  #        http://ruby-doc.org/core-2.4.3/Array.html#method-i-join
  #
  # returns: a formatted string for pretty printing
  #
  def pretty_format
    ### FILL IN YOUR CODE HERE
    words = @hash.keys
    sorted_words = words.sort
    pretty = ""
    #go through array of sorted words and add them to string
    sorted_words.each { |word|
      pretty = pretty + word + ": "
      numbers = @hash[word]
      # add the sorted line numbers
      sorted_numbers = numbers.sort
      line_numbers = sorted_numbers.join(",")
      pretty = pretty + line_numbers + "\n"      
    }
    return pretty
  end

end
