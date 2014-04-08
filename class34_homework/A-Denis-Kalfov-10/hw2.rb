print "Enter 'c' or 'd' :"
c_d=gets.chomp


print "Enter n: "
n = gets.chomp

if (c_d=='c')
	print "Enter m: "
	m = gets.chomp

	print "Enter e: "
	e = gets.chomp

	c = (m.to_i**e.to_i) % n.to_i
	
	print "c: "
	puts c

elsif (c_d=='d')
	print "Enter c: "
	c = gets.chomp

	print "Enter d: "
	d = gets.chomp
	
	dm = (c.to_i**d.to_i) % n.to_i
	
	print "dm: "
	puts dm
end