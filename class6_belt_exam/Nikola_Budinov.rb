require 'csv'

bigger = []
CSV.foreach("bank.csv") do |row|


 
	if row[2].to_i > ARGV[0].to_i
		bigger << row
	end
end
bigger = bigger.sort


CSV.open("bank_result.csv", 'w') do |csv| 
	

	bigger.each do |el| 
	csv << el
	end
end

