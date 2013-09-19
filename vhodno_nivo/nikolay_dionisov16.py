#16 zada4a

x = int(input('4islo: '))

u = -1
array = list()

def prosto(n):
	for i in range(2, n):
		if n % i == 0:
			return False
	return True
	
	
def our_num(a):
	#zavurshva na x?
	if a % 10 != x:
		return int(-1)
	if prosto(a) != True:
		return int(-1)
	return a

for i in range(0, 10):
	while True:
		u = u + 1
		if our_num(u) != -1:
			array.append(u)
			break
			
print(array)
