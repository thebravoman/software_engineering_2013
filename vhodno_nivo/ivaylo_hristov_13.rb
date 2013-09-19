print "Please enter x ( x < 0 < 10 ) "
x = gets.to_i
while x >= 10 || x <= 0
	print "x must be bigger than 0 and smaller than 10, please try again "
	x = gets.to_i
end
a = Array.new
a2 = Array.new
i = 0
puts "The sum is from cos rad"
while i < 10
	a2 = (i*x..(i+1)*x)
	sum = 0
	a2.each { |s| sum += Math.cos(s) }
	a.push(sum)
	i += 1
end
puts a
