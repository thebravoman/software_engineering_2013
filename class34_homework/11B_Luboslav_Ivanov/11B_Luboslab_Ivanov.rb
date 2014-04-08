require 'prime'

def prime_generator(start_number, end_number)
	number = 0

	while (true)
		number = rand(end_number)
		if number > start_number && Prime.prime?(number) == true
			return number
		end
	end

end

prime1 = prime_generator 256, 512
prime2 = prime_generator 256, 512

if prime1 == prime2
	while prime1 == prime2
		prime1 = prime_generator 256, 512
		prime2 = prime_generator 256, 512
	end
end


n = prime1 * prime2

fn = (prime1 - 1) * (prime2 - 1)
  
e = 2
for i in 2..fn
  if(i.gcd(fn) == 1)
    e = i
    break
  end
end

d = 0
for i in 1..(fn+1)
  if (i * e - 1) % fn == 0
    d = i
    break
  end
end

puts "Public key = #{n}, #{e}"
puts "Private key = #{n}, #{d}"
puts
puts


m = 101

cm = ((m**e) % n) 

dm = ((cm**d) % n)

puts "Message = #{m}"
puts "Cripted Message = #{cm}"
puts "Decripted Message = #{dm}"