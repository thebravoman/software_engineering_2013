def encrypt(m,e,n):
	c = (m**e)%n
	print "Encrypted:", c
	return c

def decrypt(c,d,n):
	print "Decrypted:", (c**d)%n

m = int(input("Input m: "))
n = int(input("Input n: "))
e = int(input("Input e: "))
d = int(input("Input d: "))

c = encrypt(m,e,n)
decrypt(c,d,n)