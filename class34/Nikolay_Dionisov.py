import random
minprimary = 128
maxprimary = 512

def is_prime(x):
	for i in range(2, x):
		if x % i == 0:
			return False
	return True
def generate_random_prime():
	nth = random.randrange(1, 3)
	it = 0
	while True:
		for i in range(minprimary, maxprimary):
			if is_prime(i):
				it+=1
				if nth == it:
					return i

from fractions import gcd

def generate_rsa_keys():
	p = generate_random_prime()
	q = p
	while q == p:
		q = generate_random_prime()
	
	n = p * q
	fn = (p-1) * (q-1)

	e = 2
	for i in range(2, fn):
		if(gcd(i, fn) == 1):
			e = i
			break
	

	d = 0
	for i in range(1, fn + 1):
		if (i * e - 1) % fn == 0:
			d = i
			break

	print("Public: ", n, e)
	print("Private: ",n, d)

	raw = 24
	c = (raw ** e) % n
	dm = (c ** d) % n
	print("Input: " , raw)
	print("Encrypted: ", c)
	print("Decrypted: ", dm)



if __name__ == "__main__":
	generate_rsa_keys()