def is_prime(n)
	if(n<1)
		return false
	end
	
	for i in 2..(n-1)
		if n%i==0
			return false
		end
	end
	return true
end

def get_prime_number(bound, precise)
	while(true)
		n=rand(bound)+precise
		if is_prime(n)==true
			return n
		end
	end
end

def generate_rsa()
	p=get_prime_number(384, 128)
	begin
		q=get_prime_number(384, 128)
	end until p!=q

	n=p*q
	fn=(p-1)*(q-1)

	begin
		e=get_prime_number(fn-3, 2)
	end until fn.gcd(e)==1

	i=1
	while(true)
		if (fn*i+1)%e==0
			d=(fn*i+1)/e
			break
		end
		i+=1
	end
	
	printf("%d %d\n", n, e)
	printf("%d %d\n", n, d)
end

def generate_dsa()
	q=get_prime_number(512, 512)
	
	begin
		p=(rand(9999)+1)*q+1
	end until is_prime(p)
	
	begin
		h=rand(2..p-1)
		g=(h**((p-1)/q))%p
	end until g!=1
	
	x=rand(1..q)
	y=(g**x)%p
	
	printf("%d, %d, %d, %d\n", p, q, g, y)
	puts x
	
end

print "Molq izberete RSA ili DSA: "
check=gets.chomp()

if check=="RSA"
	generate_rsa()
elsif check=="DSA"
	generate_dsa()
else
	puts "Wrong choice!"
end
