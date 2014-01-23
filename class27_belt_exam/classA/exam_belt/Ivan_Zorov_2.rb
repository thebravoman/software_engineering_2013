require 'csv'

girls = []

CSV.foreach(ARGV[0]) do |row|
	if row[4].to_s.include? ARGV[1]
		girls << row
	end
end

girls = girls.sort_by 	{|e1,e2,e3,e4,e5| e2}

CSV.open("momicheta_result.csv", "w") do |csv|
	girls.each do |e|
		csv << e
	end
end	
