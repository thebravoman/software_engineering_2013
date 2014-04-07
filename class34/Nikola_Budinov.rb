
q = 0
p = 0
i = 0
r = 0
s = false

def prime(n)
	i = 2
	while i < n
		if n % i == 0 
			s = false
			break
		else		
			s = true
		end
		i+=1;
	end
return s
end

while q == p
	while p == 0
		r = rand(384) + 128
		if(prime(r)) 
			p = r
		end
	end

	while q == 0
		r = rand(384) + 128
		if(prime(r)) 
			q = r
		end
	end
end

#print 'q = ', q, "\n"
#print 'p = ', p, "\n"

n = p * q
fn = (p - 1) * (q - 1)

e = rand(fn - 1) + 1

d = 0
while (true)
#	puts d	    not always works
	if e * d % fn == 1
		break
	else
	d += 1	
	
	end
end


#print 'n = ', n, "\n"
#print 'e = ', e, "\n"
#print 'fn = ', fn, "\n"
#print 'd = ', d, "\n"

print 'public: ', n, ' ', e, "\n"
print 'private: ', n,' ', d, "\n"




