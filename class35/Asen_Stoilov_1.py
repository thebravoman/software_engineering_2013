n = int(input("Input n: "))
e = int(input("Input e: "))

p=0
q=0
for i in range(128, 1024):
	for j in range(i+1,1024):
		if j*i ==n :
			p=i
			q=j


fn = (p-1)*(q-1)

def gen_d(e,fn):
	i=0
	while True:
		d=(fn*i+1)/e;
		if((fn*i+1)%e==0): return d
		i+=1			
		
d= gen_d(e,fn)

print d
