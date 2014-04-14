require 'openssl'
require 'digest/sha1'
require 'prime'

def generate_prime
	while true do
		num = rand(0..256)
		return num if num.prime?
	end
end

class DSA
	
	def generate_keys 

		q = generate_prime
		p = q^2 + 1

		g = 0
		h = 2

		while (h<(p-1)) do
			if (h**((p - 1) / q)) % p != 0
				g = (h**((p - 1) / q)) % p
				break
			end
			h += 1
		end

		x = rand(1..q).to_i
		y = (g**x) % p

		private_key = x
		public_key = [p, q, g, y]

		puts "Private key - [#{private_key}]"
		puts "Public key - #{public_key}"

		return [private_key, public_key]
	end

	def encryption (keys, msg)

		private_key = keys[0]
		public_key = keys[1]

		hash = OpenSSL::Digest.new('SHA1', msg.to_s);
		puts hash

		begin
			begin
				k = rand(1..public_key[1]).to_i
				r = ((public_key[2]**k) % public_key[0]) % public_key[1]
			end while r == 0

			s = ((hash + private_key*r) / k) % public_key[1]
		end while s == 0

		sign = [r, s]
	end

end
