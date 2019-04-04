def add(a,b)
	c = a + b
end

puts("Please enter the first number")
a = gets.chomp.to_i
puts("Please enter the second number")
b = gets.chomp.to_i
result = add(a,b)
puts("The sum of the numbers is:" + result.to_s)
