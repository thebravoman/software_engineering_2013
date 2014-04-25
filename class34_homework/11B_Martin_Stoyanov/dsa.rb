require 'prime'
def prime_generation	
	while (true)
		number = rand(513)
			if  Prime.prime?(number) == true && number > 128
				return number
			end
	end
end

puts "Enter the number"
msg = gets.to_i

p = prime_generation
q = prime_generation

if p == q
	while p == q
		p = prime_generation
		q = prime_generation
	end
end

n = p * q
fn = (p - 1) * (q - 1)
  
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

cm = (msg**e) % n
dm = (cm**d) % n

puts "Original = #{msg}"
puts "Crypted  = #{cm}"
puts "Decrypted  = #{dm}"