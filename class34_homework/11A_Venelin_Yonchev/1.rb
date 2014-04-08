include Math
require 'rational'
i = 1;
prime_numbers = [131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509]
p = prime_numbers[rand(66)].to_i
q = prime_numbers[rand(66)].to_i
d = 0;

while p == q do
	q = prime_numbers[rand(66)].to_i
	end

n = p*q

fn = (p - 1)*(q - 1)



while(true) do
e = rand(fn);
	if  e.gcd(fn) == 1
		break
	end
end

while  e*d % fn != 1
		d = d+1
end


puts "p = #{p}"
puts "q = #{q}"
puts "n = #{n}"
puts "fn = #{fn}"
puts "e = #{e}"
puts "d = #{d}"
puts "Public = #{n}, #{e}"
puts "Private = #{n}, #{d}
