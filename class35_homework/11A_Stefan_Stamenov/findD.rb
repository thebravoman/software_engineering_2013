n=389371
i=2;
j=0
p=0;
q=0;
while(j<2)
	if n%i==0
		if j==0
			p=i
		else
			q=i
		end
	j+=1
	end
	i+=1
end
puts p
puts q



def find_d(fn, e)
	for i in 1..fn
		if i*e % fn == 1
			return i
		end
	end
end

	e = 1351
	fn = (p-1)*(q-1)
	d = find_d(fn, e)
	puts d
