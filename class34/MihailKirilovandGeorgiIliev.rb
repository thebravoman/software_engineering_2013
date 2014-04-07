
prime_numbers = [131,137,139,149,151,157,163,167,173,179,181,191,193,197,199,211,223,227,229,233,239,241,251]
pp = prime_numbers[rand(23)]
q = prime_numbers[rand(23)]

n = pp * q

fn = (pp-1)*(q-1);
e = rand(fn)

while e.gcd(fn) != 1 do
	e = rand(fn);
end


i = 1;

while true
	d = (fn*i) / e
	if((fn*i+1) % e == 1) 
		break;
	end
	i = i+1
end

puts "Private key = #{n}#{e}"
puts "Public key = #{n}#{d}"