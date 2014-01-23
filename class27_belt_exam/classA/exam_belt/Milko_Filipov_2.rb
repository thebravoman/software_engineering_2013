require 'csv'
rows = []	
	
	CSV.foreach(ARGV[0]) do |row|
		if row[4].to_s.include? ARGV[1].to_s
			rows << row
		end
	end
	
	rows = rows.sort_by{|e1,e2,e3,e4| e2 }
	
	CSV.open("momicheta_result.csv", 'w') do |csv|
		rows.each do |e|
			csv << e
		end
	end
