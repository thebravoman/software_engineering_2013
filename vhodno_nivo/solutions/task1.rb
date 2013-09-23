x = gets.chomp().to_i
y = gets.chomp().to_i

sum = 0
x.upto(y-1).each do |i|
	if i % 2 ==1 
		sum += i
	end
end
puts sum

# y..

# x -> y
# i/odd/even
# sumy
