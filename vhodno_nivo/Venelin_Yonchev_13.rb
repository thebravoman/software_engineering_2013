print "enter number between 0 and 10 "
x = gets.to_i
while x >= 10 || x <= 0 
	print "(0 < x < 10) "
	x = gets.to_i
end
m = Array.new
i = 0
while i < 10
	a = Array(i*x..(i+1)*x)
	sum = 0
	a.each { |s| sum += Math.cos(s) }
	m.push(sum)
	i += 1
end
puts m
