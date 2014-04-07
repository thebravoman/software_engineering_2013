#!/usr/bin/python

def encrypt(keys, number):
	return number**keys[1] % keys[0]


def decrypt(keys, number):
	return number**keys[2] % keys[0]

if __name__ == '__main__':
	n = int(input("Enter N: "))

	t = 'a'
	while t != 'E' and t != 'D':
		t = raw_input("Enter Encrypt/Decrypt: ")
	i = int(input("Enter key: "))

	num = int(input("Enter integer: "))
	if t == 'E':
		print "Encrypted:", encrypt((n,i,0), num)
	else:
		print "Decrypted:", decrypt((n,0,i), num)


