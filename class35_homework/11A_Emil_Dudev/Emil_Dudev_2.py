#!/usr/bin/python

import random
import hashlib
H = hashlib.sha1

def rsa_dencrypt(keys, number):
	return number**keys[1] % keys[0]


def mmi(a, p):
	inv = 1

	while a*inv%p != 1:
		inv += 1

	return inv


def dsa_sign(keys, number):
	p, q, g, x = keys

	s = 0
	while s == 0:
		r = 0
		while r == 0:
			k = int(random.random()*(q-1)) + 1
			r = (g**k % p) % q

		m = int(H(number).hexdigest(), 16)
		s = ( mmi(k, q) * (m + (x*r)) ) % q

	return (r, s)

def dsa_verify(keys, signature, number):
	p, q, g, y = keys
	r, s = signature

	if r <= 0 or r >= q or s <= 0 or s >= q:
		return False

	w = mmi(s, q)
	u1 = ( int(H(number).hexdigest(), 16) * w ) % q
	u2 = r * w % q
	v = ( (g**u1)*(y**u2) % p ) % q
	
	return v == r


if __name__ == '__main__':
	a = 'a'
	while a != 'R' and a != 'D':
		a = raw_input("Enter Rsa/Dsa: ")

	num = raw_input("Enter integer: ")

	if a == 'R':
		n = int(input("Enter N: "))
		i = int(input("Enter key: "))

		t = 'a'
		while t != 'E' and t != 'D':
			t = raw_input("Enter Encrypt/Decrypt: ")

		if t == 'E':
			print "Encrypted:", rsa_dencrypt((n,i), num)
		else:
			print "Decrypted:", rsa_dencrypt((n,i), num)

	else:
		p = int(input("Enter p: "))
		q = int(input("Enter q: "))
		g = int(input("Enter g: "))
		key = int(input("Enter key: "))
		keys = (p, q, g, key)

		t = 'a'
		while t != 'S' and t != 'V':
			t = raw_input("Enter Sign/Verify: ")

		if t == 'S':
			print "Signed:", dsa_sign(keys, num)
		else:
			r = int(input("Enter r: "))
			s = int(input("Enter s: "))
			print "Valid: ", dsa_verify(keys, (r, s), num)

