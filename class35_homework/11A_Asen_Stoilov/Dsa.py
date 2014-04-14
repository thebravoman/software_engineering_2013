import random
import hashlib

def rand_num():
	num = random.randrange(0,256)
	count = 0
	for i in range(1, num):
		if num%i==0: count+=1
	if count < 2: return num
	return rand_num()
		

def generate_dsa():
	q = rand_num()
	p = q^2 +1
	g = 0 
	h = 2
	
	while h< p-1 :
		if (h**((p - 1) / q)) % p != 0:
			g = (h**((p - 1) / q)) % p
			break
		h += 1

	x = random.randrange(1,q)
	y = (g**x)%p

	private = x
	public = [p, q, g, y]

	return (private,public)

def encrtipt(keys,m):
	priv = keys[0]
	pub = keys[1]

	k = 0
	r = 0
	while True:
		k = random.randrange(1,pub[1])
		r = ((pub[2]**k) % pub[0]) % pub[1] 
		if r!=0:
			break

	while True:
		s = ((m+priv*r)%pub[0])%pub[1]
		if s!=0: break		
	return(r,s)		

keys = generate_dsa()

message = str(input("Input message: "))
m = hashlib.sha1(message).hexdigest()
m_ = int(m,16)
enc = encrtipt(keys,m_)

if __name__ == "__main__":
	print "private key: ", keys[0]
	print "private key: ", keys[1] 
	print "encripted: ",enc
