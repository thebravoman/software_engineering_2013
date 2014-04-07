

prime_numbers = [131,137,139,149,151,157,163,167,173,179,181,191,193,197,199,211,223,227,229,233,239,241,251]


pp = q = 0;
while(pp == q)
	pp = prime_numbers[rand(23)]
	q = prime_numbers[rand(23)]
end

n = pp * q
fn = (pp-1)*(q-1);

e = 2
i = 2;
while i <= fn
	if(i.gcd(fn) == 1)
		e = i
		break
	end
	i = i + 1
end

d = 0
i = 1
while(i <= fn+1)
	if (i * e - 1) % fn == 0
		d = i
		break
	end
	i = i + 1
end

puts "Public key = #{d},#{n}"
puts "Private key = #{e},#{n}"

