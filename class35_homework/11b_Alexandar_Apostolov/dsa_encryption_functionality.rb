require 'rational.rb'
require 'openssl'
require 'digest/sha1'

def give_me_a_prime

	# 0..256
	primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 
		31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 
		73, 79, 83, 89, 97, 101, 103, 107, 109, 
		113, 127, 131, 137, 139, 149, 151, 157, 
		163, 167, 173, 179, 181, 191, 193, 197, 
		199, 211, 223, 227, 229, 233, 239, 241, 
		251]
	
	return primes[rand(54)].to_i

end

def generate_keys
	puts
	puts "Generating keys..."
	puts 

	q = give_me_a_prime
	p = q*q + 1

	g = 0
	h = 2

	while h < p - 1 do
		if (h**((p - 1) / q)) % p != 0
			g = (h**((p - 1) / q)) % p
			break
		end
		h += 1
	end

	x = rand(1..q).to_i
	y = (g**x) % p

	puts "q = #{q}"
	puts "p = #{p}"
	puts "g = #{g}"
	puts "x = #{x}"
	puts "y = #{y}"

	pri_key = x
	pub_key = [p, q, g, y]

	puts "Keys generated!"
	puts

	puts "Private key - [#{pri_key}]"
	puts "Public key - #{pub_key}"
	puts

	return [pri_key, pub_key]

end

def encryption (keys, msg)

	pri_key = keys[0]
	pub_key = keys[1]

	hash = OpenSSL::Digest.new('SHA1', msg.to_s);
	puts hash
	begin
		begin
			k = rand(1..pub_key[1]).to_i
			r = ((pub_key[2]**k) % pub_key[0]) % pub_key[1]
		end while r == 0

		s = ((hash + pri_key*r) / k) % pub_key[1]
	end while s == 0

	sign = [r, s]
	puts sign
	puts

end 