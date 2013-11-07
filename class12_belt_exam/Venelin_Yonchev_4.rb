require 'csv'
all=[]
	CSV.foreach(ARGV[0]) do |row|
		if "#{ARGV[1]}".downcase == row[1].to_s.downcase
			all << row[0..5]
		end
	end
	
	CSV.open("laptops_processor_result.csv","w") do |csv|
		all=all.sort{|a,b| a[2]<=>b[2]}
		all.each do |element|
			csv << element
		end
	end
