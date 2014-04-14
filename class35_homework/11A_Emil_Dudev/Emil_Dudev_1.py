#!/usr/bin/python

import random
import itertools
import math
xrange = lambda start, stop: iter(itertools.count(start).next, stop)

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


def generate_rsa_keys():
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
	
	return ((n,e), (n,d))


def generate_dsa_keys():
	L = 20
	N = 10
	q = generate_prime(0, 2**N)

	i = 1
	p = i * q + 1
	while int(math.log(p, 2)) + 1 < L:
		p = i * q + 1
		i += 1

	while not is_prime(p):
		p = i * q + 1
		i += 1

	g = 1
	h = 2
	while g == 1:
		g = h**((p-1)/q)

	x = int(random.random()*(q-1)) + 1
	y = g**x%p

	return ((p, q, g, y), x)


if __name__ == '__main__':
	t = 'a'
	while t != 'R' and t != 'D':
		t = raw_input("Enter Rsa/Dsa: ")

	if t == 'R':
		keys = generate_rsa_keys()
	else:
		keys = generate_dsa_keys()

	print "public:", keys[0]
	print "private:", keys[1]

