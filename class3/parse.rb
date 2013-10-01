require 'csv'
a = []
sum =0
CSV.foreach("results1.csv") do |row|
	if row[2] == 'true'
		a << row[0].to_s
		sum+=1
	end
end
puts a.sort
