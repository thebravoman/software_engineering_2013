#!/usr/bin/python

import random
import bisect

primes = [2, 3]

def is_prime(n):
	print "primes:", n, primes
	if primes[-1] < n:
		for i in primes:
			if n % i == 0:
				return False

		i = primes[-1] + 1
		while i != n:
			for j in primes:
				if j*j > i:
					primes.append(i)
					if n % i == 0:
						return False
					break

				if i % j == 0:
					break
			i += 1

	return primes[bisect.bisect_left(primes, n)] == n

def generate_prime(bottom, top):
	i = 1
	while not is_prime(i):
		print "i:", i
		i = random.randint(bottom, top)

	return i

def generate_keys(minbits=12*8):
	p = 12131072439211271897323671531612440428472427633701410925634549312301964373042085619324197365322416866541017057361365214171711713797974299334871062829803541
	q = 12027524255478748885956220793734512128733387803682075433653899983955179850988797899869146900809131611153346817050832096022160146366346391812470987105415233
	n = 145906768007583323230186939349070635292401872375357164399581871019873438799005358938369571402670149802121818086292467422828157022922076746906543401224889672472407926969987100581290103199317858753663710862357656510507883714297115637342788911463535102712032765166518411726859837988672111837205085526346618740053
	fn = 145906768007583323230186939349070635292401872375357164399581871019873438799005358938369571402670149802121818086292467422828157022922076746906543401224889648313811232279966317301397777852365301547848273478871297222058587457152891606459269718119268971163555070802643999529549644116811947516513938184296683521280
	e = 65537
	d = 89489425009274444368228545921773093919669586065884257445497854456487674839629818390934941973262879616797970608917283679875499331574161113854088813275488110588247193077582527278437906504015680623423550067240042466665654232383502922215493623289472138866445818789127946123407807725702626644091036502372545139713
	return (n, e, d)

	p = 18286801584533905673
	q = 16865103009809188019
	n = 308408792443106201176269522226867731787
	fn = 308408792443106201141117617632524638096
	e = 65537
	d = 159863208387395833788011452898278750641
	return (n, e, d)

	lower_bound = 2**(minbits / 2)
	upper_bound = 2**((minbits+8) / 2)

	p = generate_prime(lower_bound, upper_bound)
	print "p:", p

	q = p
	while q == p:
		q = generate_prime(lower_bound, upper_bound)
	print "q:", q

	n = p*q
	print "n:", n

	fn = (p-1)*(q-1)
	print "fn:", fn

	e = generate_prime(1, fn)
	print "e:", e

	d = 0
	while True:
		if e * d % fn == 1:
			break
		d += 1
	print "d:", d
	
	return (n, e, d)

def encrypt(n, e, message):
	k = n.bit_length() / 8
	encryption_block = bytearray()

	padding_string = bytearray()
	while(len(padding_string) != k - 3 - len(message)):
		padding_string.append(random.randint(1, 255))

	encryption_block.append(0)
	encryption_block.append(2)
	encryption_block += padding_string
	encryption_block.append(0)
	encryption_block += message

	x = 0
	for i, v in enumerate(encryption_block):
		x += 2**(8*(k-i-1))*v

	y = pow(x, e, n)

	pretty_y = hex(y).rstrip("L").lstrip("0x")
	if len(pretty_y) % 2 == 1:
		pretty_y = "0" + pretty_y

	encrypted_data = bytearray(pretty_y.decode("hex"))

	return encrypted_data

def encrypt_string(n, e, message):
	message = bytearray(message)
	message.append(0)

	return encrypt(n, e, message)

def decrypt(n, d, encrypted_data):
	k = n.bit_length() / 8

	y = 0
	for i, v in enumerate(encrypted_data):
		y += 2**(8*(k-i-1))*v

	x = pow(y, d, n)

	pretty_x = hex(x).rstrip("L").lstrip("0x")
	if len(pretty_x) % 2 == 1:
		pretty_x = "0" + pretty_x

	encryption_block = bytearray(pretty_x.decode("hex"))
	message = bytearray()
	for i, v in enumerate(encryption_block):
		if i == 0:
			continue
		if v == 0:
			message = encryption_block[i+1:]
			break

	return message

def decrypt_string(n, d, encrypted_data):
	message = decrypt(n, d, encrypted_data)
	message.pop()

	return str(message)

keys = generate_keys()
encrypted_data = encrypt_string(keys[0], keys[1], "HelloThere")
print "encrypted", binascii.hexlify(encrypted_data)
decrypted_data = decrypt_string(keys[0], keys[2], encrypted_data)
print "decrypted", decrypted_data
