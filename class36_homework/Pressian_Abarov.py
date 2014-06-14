import itertools as it
from collections import namedtuple
import math
import random
import hashlib

def erat3(): #muahahaha
    D = { 9: 3, 25: 5 }
    yield 2
    yield 3
    yield 5
    MASK= 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0,
    MODULOS= frozenset((1, 7, 11, 13, 17, 19, 23, 29))

    for q in it.compress(
            it.islice(it.count(7), 0, None, 2),
            it.cycle(MASK)):
        p = D.pop(q, None)
        if p is None:
            D[q*q] = q
            yield q
        else:
            x = q + 2*p
            while x in D or (x%30) not in MODULOS:
                x += 2*p
            D[x] = p

def relativePrimes(a, b):
	for n in range(2, min(a, b) + 1):
		if a % n == b % n == 0:
			return False
	return True

def genRandPrime(maximum):
    generator = erat3()
    nth = random.randrange(1, math.floor(maximum/math.log(maximum))) # >:)
    for i in xrange(nth):
        _ = generator.next()
    return generator.next()

def makePair(length):
	n_max = (1 << length) - 1
	p = q = genRandPrime(n_max)
	while(p == q):
		q = genRandPrime(n_max)

	stop = (p - 1) * (q - 1)
	for e in range(3, stop, 2):
		if relativePrimes(e, stop):
			break

	for d in range(3, stop, 2):
		if d * e % stop == 1:
			break

	return PublicKey(p * q, e), PrivateKey(p * q, d)

class PublicKey(namedtuple('PublicKey', 'n e')):
	def encrypt(self, msg):
		encrypted = []
		for i in msg:
			encrypted.append(pow(ord(i), self.e, self.n))
		return encrypted


class PrivateKey(namedtuple('PrivateKey', 'n d')):
	def decrypt(self, msg):
		decrypted = ""
		for i in msg:
			decrypted.append(chr(pow(i, self.d, self.n)))
		return decrypted

if __name__ == '__main__':
	pass
