# Convert words to/from Morse code.
# Tom Reichlmayr, RIT 2/3/2008
# Revised by Mike Lutz, RIT, 2/3/2008
# Revised by Andy Meneely, RIt, 9/29/2014
# Revised by YOUR NAME, RIT, DATE

# Translate a word (letters) to Morse code. Returns the Morse code string
# (with a space between the codes for adjacent letters).
 # Map from characters to Morse code

LETTERS_TO_MORSE = {
    "A" => ".-",
    "B" => "-...",
    "C" => "-.-.",
    "D" => "-..",
    "E" => ".",
    "F" => "..-.",
    "G" => "--.",
    "H" => "....",
    "I" => "..",
    "J" => ".---",
    "K" => "-.-",
    "L" => ".-..",
    "M" => "--",
    "N" => "-.",
    "O" => "---",
    "P" => ".--.",
    "Q" => "--.-",
    "R" => ".-.",
    "S" => "...",
    "T" => "-",
    "U" => "..-",
    "V" => "...-",
    "W" => ".--",
    "X" => "-..-",
    "Y" => ".-.-",
    "Z" => "--.."
}


# Translate from normal language to Morse code
#
# Given:  a string of letters and anything else
# Return: a space-delimited string of letters in Morse code
# 
# Ignore any non-alphabetic characters.
# Must base case-insensitive
def to_morse(str)
  ### YOUR CODE HERE ###
  # make string uppercase
  str = str.upcase
  out = ""
  # split string to get chars
  char_loop = str.split('')
  char_loop.each do |char|
    # check if char is in hash map also gets only valid chars
    if LETTERS_TO_MORSE.key?(char)
      out = out + LETTERS_TO_MORSE[char] + " "
    end
  end
  return out
end

# Translate Morse code to the alphabetic (word) equivalent.
# Given: a space-delimited string of morse code, with possible other characters
# Return: a string of characters decoded from Morse code.
# 
# Ignore any characters that are not spaces, periods, or dashes.
def from_morse(morse)
  ### YOUR CODE HERE ###
  # split code
  decode = morse.split(' ')
  out = ""
  decode.each do |code|
    # check if each code is in the hash map and has a value
    if LETTERS_TO_MORSE.has_value?(code)
      out = out + LETTERS_TO_MORSE.key(code)
    end
  end
  return out
end


# Read each line, if the first word (command) is ENC, 
# then convert the rest of the line to MORSE code, and print the results to the console
# If the first word is DEC, then convert the rest of the line to normal English
# and print the result to the console
# So, the format would be the command followed by a comma, then the rest of the input string. e.g.
# ENC,RIT
# or
# DEC,... --- ...
# Provide a way to exit the loop.  Use 'QUIT' as the comment to exit the loop
#
def main_input 
  $stdin.each do | line|

  # Your code here #
    line = line.chomp!
    words = line.split(',')
    if words[0] == "ENC"
      puts to_morse(words[1])
    end
    if words[0] == "DEC"
      puts from_morse(words[1])
    end
    if words[0] == "QUIT"
      break
    end
  end
end

# Uncomment the line below to run as console input
# console input works, only commented it out again because it blocks test_morse
#main_input
