$stdin.each do |line|
	# process this line
line.chomp!
line.downcase!
line.gsub(/[^a-zA-Z\s]/, '')
line.sub(/^\s+/, '')
words = line.split(/ +/)
bag = Hash.new(0)
words.each {|x| bag[x] += 1}
puts "Printing from Hash!"
bag.each {|key, value| puts "#{key}\t#{value}"}
arr = bag.select {|key, value| value > 1}
puts "Printing from Array!"
arr.each {|key, value| puts "#{key}\t#{value}"}  
end
