require 'csv'

godin = []
CSV.foreach("dogfest.csv") do |row|
	
	if (row[3].to_i >= ARGV[0].to_i) && (row[3].to_i <= ARGV[1].to_i)
		godin << row
	end
end

godin = godin.sort { |e2,e1| e2[3].to_f <=> e1[3].to_f }

CSV.open("dogfest_age_res.csv", "w") do |csv|
		godin.each do |e|
		csv << e
	
	end
end
