import random

def rand_num():
	num = random.randrange(128,512)
	count = 0
	for i in range(1, num):
		if num%i==0: count+=1

	if count < 2: return num
	return rand_num()

def gcd(a,b):
	i=1
	gcd =0
	while i<=a and i<=b:
		if a%i==0 and b%i==0: gcd =i
		i+=1
	return gcd	

def gen_d(e,fn):
	i=0
	while True:
		d=(fn*i+1)/e;
		if((fn*i+1)%e==0): return d
		i+=1


def generate_keys():

	p = rand_num()
	q = rand_num()
	while q == p:
		q = rand_num()

	n = p*q	
	fn = (p-1)*(q-1)
	e =0
	while True:
		e = random.randrange(1,fn)
		if gcd(e,fn)==1: break

	d= gen_d(e,fn)


	return(n,e,d)

keys = generate_keys()
print "public:", keys[0], keys[1]
print "private:", keys[0], keys[2]

