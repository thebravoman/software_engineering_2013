require 'prime'

p =  rand(128..512)
while(!Prime.prime?(p)) do 
	p =  rand(128..512)
end

q = rand(128..512)
while(!Prime.prime?(q)) do 
	q =  rand(128..512)
	while(q == p) do
		q =  rand(128..512)
	end
end

n = p*q
fn = (p-1)*(q-1)

e = rand(1..fn)
while(e.gcd(fn) != 1) do
	e = rand(1..fn)
end

i = 1
d = 0
while(true) do
	break if e*d % fn == 1
	d += 1
end

puts "public key #{n} #{e}"
puts "private key #{n} #{d}"



