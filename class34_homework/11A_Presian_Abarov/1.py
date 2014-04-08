import random

def isPrime(x):
	for i in range(2,x):
		if x%i == 0:
			return False
	return True

def genRandPrime():
    index = random.randrange(65)
    for i in range(128,512):
        if isPrime(i):
            if(index == 0):
                return i
            index -= 1

def genRsaKeys():
    p = genRandPrime()
    q = genRandPrime()
    n = p*q
    fn = (p-1)*(q-1)

    for i in reversed(range(2, fn)):
        if gcd(i, fn) == 1:
            e = i
            break

    for i in reversed(xrange(1, fn)):
        if (i*e-1)%fn == 1:
            d = i
            break

    return {'public': [p, e], 'private': [q, d]}

from fractions import gcd
if __name__ == "__main__":
    print(genRsaKeys())


    

    
    
    



            
