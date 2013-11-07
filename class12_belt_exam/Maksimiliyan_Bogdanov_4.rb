require 'csv'
a=[]
	CSV.foreach(ARGV[0]) do |row|
		if "#{ARGV[1]}".downcase == row[1].to_s.downcase
			a << row[0..5]
			puts a
		end
	end
	
	CSV.open("laptops_processor_result.csv","w") do |csv|
		a=a.sort{|a,b| a[2]<=>b[2]}
		a.each do |e|
			csv << e
		end
	end
