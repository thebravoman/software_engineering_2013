x = int(input("x: "))

arr = []

i = 0

def isPrime(n):
	for i in range(2,n):
		if(n%i == 0):
			return 0
	return 1

while(len(arr) < 10):
	i += 1
	if(i%10 == x):
		if(isPrime(i) == 1):
			arr.append(i)

print(arr)
