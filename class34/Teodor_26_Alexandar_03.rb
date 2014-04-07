require 'rational.rb'

prime_array = [131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251]
p = prime_array[rand(23)].to_i
puts "p = #{p}"
q = prime_array[rand(23)].to_i
while p == q do
	q = prime_array[rand(23)].to_i 
end
puts "q = #{q}"

n = p*q
puts "n = #{n}"
fn = (p - 1)*(q - 1)
puts "fn = #{fn}"

e = rand(fn).to_i

while e.gcd(fn) != 1 do
	e = rand(fn).to_i
end
puts "e = #{e}"

d = fn / e
i = 1

while (fn*i) % e == 1 do
	puts d = (fn*i + 1) / e
	i += 1
end
puts "d = #{d}"

puts "Private key #{n},#{e}"
puts "Public key #{n},#{d}"
