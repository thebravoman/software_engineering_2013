
def is_prime(x):
	for i in range(2, x / 2 + 1):
		if x % i == 0:
			return False
	return True

def find(fn):
	for i in range(2,fn):
		if fn % i == 0 and is_prime(i):
			print(i)


if __name__ == "__main__":
	find(int(input()))