$stdin.each do |line|
	# process this line
puts line.chomp.downcase.gsub(/[^a-zA-Z\s]/, '').sub(/^\s+/, '')
end
