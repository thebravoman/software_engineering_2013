require 'openssl'
require 'digest/sha1'

class Array
  def random
    shuffle.first
  end
end

def prime_number
	[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251].random.to_i
end

def generate
	q = prime_number
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

	private = x
	public = [p, q, g, y]
	
	puts
	puts "Private key:"
	puts private
	puts
	puts "Public key:"
	puts "p = #{p}"
	puts "q = #{q}"
	puts "g = #{g}"
	puts "y = #{y}"
end

def encryption (keys, message)
	private = keys[0]
	public = keys[1]

	hash = OpenSSL::Digest.new('SHA1', message.to_s);
	
	while s != 0 do
		while r != 0 do
			k = rand(1..public[1]).to_i
			r = ((public[2]**k) % public[0]) % public[1]
		end	
		s = ((hash + private*r) / k) % public[1]
	end
end 

print "Your message: "
message = gets.chomp.to_i
keys = generate
