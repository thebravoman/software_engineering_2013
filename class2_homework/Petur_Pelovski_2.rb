require "csv"

m1 = 0.00
CSV.foreach("text_file.csv") do |row|
		m1=m1+row[1].to_f
end
printf m1
