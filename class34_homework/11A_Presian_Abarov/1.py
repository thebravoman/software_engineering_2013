import random

def isPrime(x):
	for i in range(2,x):
		if x%i == 0:
			return False
	return True

def genRandPrime():
	index = random.randrange(65)
	for i in xrange(2,2**32):
		if isPrime(i):
			if(index == 0):
				return i
			index -= 1


def genRsaKeys():
	q = p = genRandPrime()
	while p == q:
		q = genRandPrime()
	n = p*q
	fn = (p-1)*(q-1)

	e = 0
	while e == 0:
		i = random.randrange(0, fn)
		if gcd(i, fn) == 1:
			e = i

	for i in reversed(range(1, fn)):
		if (i*e)%fn == 1:
			d = i
			break

	return {'public': [e, n], 'private': [d, n]}

from fractions import gcd
if __name__ == "__main__":
	print(genRsaKeys())


	

	
	
	



			
