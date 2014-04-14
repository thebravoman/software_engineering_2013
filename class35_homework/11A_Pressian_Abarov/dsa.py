import random
import math
import itertools as it
import hashlib

#incomplete

def erat3( ): #muahahaha
    D = { 9: 3, 25: 5 }
    yield 2
    yield 3
    yield 5
    MASK= 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0,
    MODULOS= frozenset( (1, 7, 11, 13, 17, 19, 23, 29) )

    for q in it.compress(
            it.islice(it.count(7), 0, None, 2),
            it.cycle(MASK)):
        p = D.pop(q, None)
        if p is None:
            D[q*q] = q
            yield q
        else:
            x = q + 2*p
            while x in D or (x%30) not in MODULOS:
                x += 2*p
            D[x] = p

def genRandPrime(maximum):
    generator = erat3()
    nth = random.randrange(1, math.floor(maximum/math.log(maximum))) #1?
    for i in xrange(nth):
        _ = generator.next()
    return generator.next()

if __name__ == "__main__":
    N = 22 #int(raw_input("N: "))
    L = 4 #int(raw_input("L: "))

    while True:
        q = genRandPrime((1<<N)-1)
        print q
