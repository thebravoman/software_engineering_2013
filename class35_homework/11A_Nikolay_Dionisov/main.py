import random
minprimary = 512
maxprimary = 1024

def is_prime(x):
	for i in range(2, x):
		if x % i == 0:
			return False
	return True
def generate_random_prime():
	nth = random.randrange(1, (maxprimary - minprimary) / 2)
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

	e = 0
	random_val = random.randrange(minprimary, maxprimary) * 2
	for i in range(minprimary + random_val, fn + maxprimary + random_val):
		if(gcd(i, fn) == 1):
			e = i
			break
	if e == 0:
		for i in range(2, fn + 1):
			if(gcd(i, fn) == 1):
				e = i
	

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

#copy - paste stack overflow
def invmodp(a, p):
    '''
    The multiplicitive inverse of a in the integers modulo p.
    Return b s.t.
    a * b == 1 mod p
    '''
    
    for d in range(1, p):
        r = (d * a) % p
        if r == 1:
            break
    else:
        raise ValueError('%d has no inverse mod %d' % (a, p))
    return d
def generate_dsa_keys():
	q = generate_random_prime()
	p = q * random.randrange(1,10000) + 1
	while not is_prime(p):
		p = q * random.randrange(1,10000) + 1


	g = 2 ** ((p-1) // q) % p

	x = random.randrange(1, q)
	y = g ** x % p
	print("Public: ", p, q, g, y)
	print("Private: ", x)


	hash_msg = hash(input())
	r = 0
	k = 0
	s = 0
	while r == 0:
		k = random.randrange(1, q)
		r = (g ** k % p) % q
		s = invmodp(k, q) * (hash_msg + x*r) % q
		if s == 0:
			continue
	print("Message: ", hash_msg)
	print("Signature: ", r, s)

	w = invmodp(s, q) % q
	u1 = hash_msg * w % q
	u2 = r * w % q
	v = ((g**u1) * (y ** u2)) % p % q
	print("The signature is valid: ", v == r, v)


import sys
import re
def decrypt(n, d, num):
	print(num ** d % n)
def sdecrypt(n, d):
	while True:
		s = input()
		nums = re.findall(r'\d+', s)
		for i in nums:
			num = int(i)
			decrypt(n,d,num)

def encrypt(n, e, num):
	print(num ** e % n)
def sencrypt(n, e):
	while True:
		s = input()
		nums = re.findall(r'\d+', s)
		for i in nums:
			num = int(i)
			encrypt(n,e,num)


if __name__ == "__main__":
	if sys.argv[1] == "gen_rsa":
		generate_rsa_keys()
	elif sys.argv[1] == "gen_dsa":
		generate_dsa_keys()
	elif sys.argv[1] == "dec":
		decrypt(int(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4]))
	elif sys.argv[1] == "enc":
		encrypt(int(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4]))
	elif sys.argv[1] == "sdec":
		sdecrypt(int(sys.argv[2]), int(sys.argv[3]))
	elif sys.argv[1] == "senc":
		sencrypt(int(sys.argv[2]), int(sys.argv[3]))