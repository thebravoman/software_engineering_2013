require 'rational.rb'

def give_me_a_prime

	primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 
		31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 
		73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 
		127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 
		179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 
		233, 239, 241, 251]
		
	return primes[rand(54)].to_i

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
