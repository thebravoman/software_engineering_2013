#!/usr/bin/python

import random

def find_d(e, fn):
	d = 0
	while True:
		if e * d % fn == 1:
			break
		d += 1
	
	return d

if __name__ == '__main__':
	print find_d(1351, 388000)

