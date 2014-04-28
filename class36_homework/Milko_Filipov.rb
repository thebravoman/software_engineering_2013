alphabet=["a", "b", "c", "d", "e", "f", 
    "g", "h", "i", "j", "k", "l", 
    "m", "n", "o", "p", "q", "r", 
    "s", "t", "u", "v", "w", "x", 
    "y", "z"]

print "Molq vavedete 'n': "
n=gets.chomp.to_i
print "Molq vavedete 'e': "
e=gets.chomp.to_i
print "Molq vavedete 'd': "
d=gets.chomp.to_i
#print "Molq vavedete suobshtenie: "
#m=gets.chomp.to_i
print "Molq izberete 'crypt' ili 'decrypt': "
check=gets.chomp
if (check=="crypt")
print "Molq vavedete suobshtenie: "
m=gets.chomp
m=m.downcase
i=0;

while i < m.length

	buff=[m[i],m[i+1]]

	for b in 0..1
		for a in 0..alphabet.length
				if (buff[b]==alphabet[a])
					if(a<10)
						a="0"+a.to_s;
					end
				
					buff[b]=a
				end
		end
	end
	
	gosho=buff[0].to_s+buff[1].to_s;
	
	c=(gosho.to_i**e)%n
	puts c
	i+=2
end
else

print "Molq vavedete criptiranoto suobshtenie s intervali na vseki 4 znaka: "
m=gets.chomp.split(" ")
g=0
	while g<m.length
		buff=m[g].to_i
		p=(buff**d)%n
		
		
		s=p%100
			for w in 0..alphabet.length
				if (s==w)
					sec=alphabet[w]
				end
			end


		f=p/100;
		for q in 0..alphabet.length
				if (f==q)
					fir=alphabet[q]
				end
		end
		
		puts fir
		puts sec
		
		
		g+=1
	end

end
