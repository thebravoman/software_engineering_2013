require "csv"

a = 0.00
b = 0.00
c = 0.00
CSV.foreach("bank.csv") do |row|

	if row[0] = ARGV[0]
		i=0
	end
	if i = 1
		a = a + row[1].to_f
		b = b + row[2].to_f	
	end
end
c = a - b
printf("%0.2f,%0.2f,%0.2f",a,b,c)
