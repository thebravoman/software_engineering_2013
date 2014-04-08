#!/usr/bin/python

import random

def is_prime(n):
	if n < 2:
		return False

	for i in xrange(2, n):
		if n % i == 0:
			return False
	return True

def find_pq(bottom, top, n):
	result = []
	for i in xrange(bottom, top):
		if is_prime(i) and n % i == 0 and is_prime(n/i):
			result.append(n/i)
			
	return result

if __name__ == '__main__':
	print find_pq(128, 1024, 389371)

