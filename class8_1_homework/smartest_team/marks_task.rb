require 'csv'
students = []

CSV.foreach(ARGV[0]) do |row|
	if row[1].to_f >= 5.50
		if row[1].to_f <= 5.59
			students << [row[0],25]
		elsif row[1].to_f <= 5.69
			students << [row[0].to_s,30]
		elsif row[1].to_f <= 5.79
			students << [row[0].to_s,35]
		elsif row[1].to_f <= 5.89
			students << [row[0].to_s,40]
		elsif row[1].to_f <= 5.99
			students << [row[0].to_s,45]
		elsif row[1].to_f == 6.00
			students << [row[0].to_s,50]
		end
	end
end

students=students.sort {|a,b| b[1] <=> a[1]}
CSV.open("#{ARGV[0].chomp(".csv")}_result.csv", "w") do |csv|
	students.each do |element|
		csv << element
	end
end
