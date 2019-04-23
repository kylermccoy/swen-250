# Script that obtains various git metrics from a basic git log file
require 'set'
require 'date'

# Given an array of git log lines, count the number of commits in the log
def num_commits(lines)
  num = 0 
  lines.each { |line|
    words = line.split
    if words[0] == "commit" then num+= 1 end
  }
  num
end

# Given an array of git log lines, count the number of different authors
#   (Don't double-count!)
# You may assume that emails make a developer unique, that is, if a developer
# has two different emails they are counted as two different people.
def num_developers(lines) 
  devs = []
  lines.each { |line|
    words = line.split(' ')
    if words[0] == "Author:"
      author = words[words.length - 1]
      devs << author
    end
  }
  devs.uniq.length
end

# Given an array of Git log lines, compute the number of days this was in development
# Note: you cannot assume any order of commits (e.g. you cannot assume that the newest commit is first).
def days_of_development(lines)
  num = 0
  dates = []
  lines.each { |line|
    words = line.split(' ')
    if words[0] == "Date:"
      words.shift
      time = ""
      words.each { |word| time = time + word + " " }
      date = DateTime.parse(time)
      dates << date
    end
  }
  if dates.length == 0
    return 0
  end
  start_late = dates.fetch(0)
  dates.each { |date_late|
    if date_late > start_late
      start_late = date_late
    end
  }
  start_early = dates.fetch(0)
  dates.each { |date_early|
    if date_early < start_early
      start_early = date_early
    end
  }
  num = (start_late - start_early).to_i
  num + 1
end

# This is a ruby idiom that allows us to use both unit testing and command line processing
# Does not get run when we use unit testing, e.g. ruby test_git_metrics.rb
# These commands will invoke this code with our test data: 
#    ruby git_metrics.rb < ruby-progressbar-short.txt
#    ruby git_metrics.rb < ruby-progressbar-full.txt
if __FILE__ == $PROGRAM_NAME
  lines = []
  $stdin.each { |line| lines << line }
  puts "Number of commits: #{num_commits lines}"
  puts "Number of developers: #{num_developers lines}"
  puts "Number of days in development: #{days_of_development lines}"
end

