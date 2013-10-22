require 'csv'

result = 0
sort_check = 1000
`ruby #{ARGV[0]} task1.csv 20`
CSV.foreach("task1_result.csv") do |row|
	if row[1].to_i>0 && row[1].to_i<=2*row[0].to_i	
	if (row[1].to_f/row[0].to_f).round(10)==(row[2].to_f).round(10)
		result = 1
	else
		result = 0
		break
	end
	if sort_check>=row[2].to_f
		sort_check=row[2].to_f
	else
		result = 0
		break
	end
	else
		result = 0
		break
	end
end

CSV.open("result.csv","w") do |csv|
	csv << [ARGV[0],result==1]
end
