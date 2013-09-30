require "csv"

a = 0.00
b = 0.00
c = 0.00
max = 0.00
d1 = ""
d2 = ""
counter = 0
neshto_si = 0.00
CSV.foreach("bank.csv") do |row|


	if counter == 0
		d1 = row[0]
		counter = counter + 1
	end
	a = a + row[1].to_f
	b = b + row[2].to_f
	if d1 != row[0]
		d1 = row[0]
		neshto_si = 0
	else 
		neshto_si = a - b
	end	
	if neshto_si > max 
		max = neshto_si
		d2 = d1
	end

end
print d2
