def findpq(n):
	pq = []
	for i in range(2,n):
		if n%i == 0:
			pq.append(i)
	return pq

def findd(fn, e):
	for i in range(fn):
		if i*e % fn == 1:
			return i

if __name__ == "__main__":
	pq = findpq(389371)
	e = 1351
	fn = (pq[0]-1)*(pq[1]-1)
	d = findd(fn, e)
	print(d)
