require 'rational.rb'

def give_me_a_prime

	#128..512
	primes = [131, 137, 139, 149, 151, 157, 
		163, 167, 173, 179, 181, 191, 193, 197, 
		199, 211, 223, 227, 229, 233, 239, 241, 
		251, 257, 263, 269, 271, 277, 281, 283, 
		293, 307, 311, 313, 317, 331, 337, 347, 
		349, 353, 359, 367, 373, 379, 383, 389, 
		397, 401, 409, 419, 421, 431, 433, 439, 
		443, 449, 457, 461, 463, 467, 479, 487, 
		491, 499, 503, 509]
		
	return primes[rand(66)].to_i

end

def generate_keys
	puts
	puts "Generating keys..."
	puts 

	p = give_me_a_prime
	begin
		q = give_me_a_prime
	end while p == q

	n = p*q
	fn = (p - 1)*(q - 1)

	begin
		e = rand(fn).to_i
	end while e.gcd(fn) != 1

	d = fn / e
	i = 1

	while true do
		if ((fn*i + 1) % e) == 0
			d = (fn*i + 1) / e
			break
		end
		i += 1
	end

	#puts "p = #{p}"
	#puts "q = #{q}"
	#puts "n = #{n}"
	#puts "fn = #{fn}"
	#puts "e = #{e}"
	#puts "d = #{d}"

	pri_key = [n, e]
	pub_key = [n, d]

	puts "Keys generated!"
	puts

	puts "Private key - #{pri_key}"
	puts "Public key - #{pub_key}"
	puts

	return [pri_key, pub_key]

end

def encryption (keys, msg)

	pri_key = keys[0]
	pub_key = keys[1]

	enc_msg = (msg**pri_key[1]) % pri_key[0]
	puts "Encrypted message:"
	puts enc_msg
	puts

	return enc_msg

end

def decryption (keys, enc_msg)

	pri_key = keys[0]
	pub_key = keys[1]

	dec_msg = (enc_msg**pub_key[1]) % pub_key[0]
	puts "Decrypted message:"
	puts dec_msg
	puts

end
