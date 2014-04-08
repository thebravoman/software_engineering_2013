def isPrime i
	for el in 2..i-1
		if i < 2
			return false
		end
		if i % el == 0
			return false
		end
	end
	return true
end

def generatePrime min, max
	i = min
	while i <= min or !isPrime(i)
		i = Random.new.rand(min..max)
	end
	return i
end

def generateKeys
	p = generatePrime(128,512)
	begin
		q = generatePrime(128,512)
	end until p!=q
	
	n = p*q
	fn = (q-1)*(p-1)
	
	e = generatePrime(1, fn)
	d = 0
	
	loop do
		if e * d % fn == 1
			break
		end
		d+=1
	end
	return n,e,d
end

def encrypt keys, number
	return (number**keys[1])%keys[0]
end

def decrypt keys, number
	return (number**keys[2])%keys[0]
end

keys = generateKeys


print "public: ", keys[0],keys[1]
puts
print "private: ", keys[0],keys[2]
puts

puts "Enter input"
input = gets
i = ''
while i != 'e' and i != 'd'
	puts "Enter e for encrypt and d for decrypt"
	i = gets

	if i.include? 'e'
		puts "Encrypted:", encrypt(keys, input.to_i)
	else
		puts "Decrypted:", decrypt(keys, input.to_i)
	end
end
