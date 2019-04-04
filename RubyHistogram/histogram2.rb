$stdin.each do |line|
        # process this line
words = line.split(/ +/)
bag = Hash.new(0)
words.each {|x| bag[x] += 1}
end
