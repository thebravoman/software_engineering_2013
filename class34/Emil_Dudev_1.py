#!/usr/bin/python

import random

def is_prime(n):
	if n < 2:
		return False

	for i in xrange(2, n):
		if n % i == 0:
			return False
	return True

def generate_prime(bottom, top):
	i = bottom
	while i <= bottom or not is_prime(i):
		i = int(random.random()*top)

	return i

def generate_keys():
	p = generate_prime(128, 512)
	q = p
	while q == p:
		q = generate_prime(128, 512)

	n = p*q
	fn = (p-1)*(q-1)

	e = generate_prime(1, fn)
	d = 0
	while True:
		if e * d % fn == 1:
			break
		d += 1
	
	return (n,e,d)

if __name__ == '__main__':
	keys = generate_keys()
	print "public:", keys[0], keys[1]
	print "private:", keys[0], keys[2]

