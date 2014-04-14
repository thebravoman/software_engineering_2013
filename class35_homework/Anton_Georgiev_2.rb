require "digest/sha1"

print "Molq vuvedete suobshtenie: "
m=gets.chomp().to_i
print "Molq izberete RSA ili DSA: "
check=gets.chomp()

if check=="RSA"
	print "Molq vuvedete n: "
	n=gets.chomp().to_i
	print "Molq vuvedete e: "
	e=gets.chomp().to_i
	
	c=m**e%n
	puts c
elsif check=="DSA"
	print "Molq vuvedete p: "
	p=gets.chomp().to_i
	print "Molq vuvedete q: "
	q=gets.chomp().to_i
	print "Molq vuvedete g: "
	g=gets.chomp().to_i
	print "Molq vuvedete y: "
	y=gets.chomp().to_i
	print "Molq vuvedete x: "
	x=gets.chomp().to_i
	
	begin
		k=rand(q-1)+1
		r=(g**k%p)%q
		s=(((Digest::SHA1.digest(m.to_s)).to_i+x*r)/k)%q
	end until(s!=0 and r!=0)
	
	printf "%d, %d\n", r, s
end
