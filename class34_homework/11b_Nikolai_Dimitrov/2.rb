#("First argument 1 for encryption 2 for decryption. Second message. Third  and fourth 2 prime numbers for public and private key.")
choice = ARGV[0]
m = ARGV[1].to_i
p = ARGV[2].to_i
q = ARGV[3].to_i
n = p * q
fn = (p-1)*(q-1);

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


if choice.to_i == 1
  puts m**e % n
else
  puts m**d % n
end
