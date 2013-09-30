require 'csv'

money = 0.00
dadate=" "
CSV.foreach('bank.csv') do |line| 
	if dadate == line[0] 
		money+=line[1].to_f
	else if money < line[1].to_f
		money = line[1].to_f
		dadate = line[0]
	end
	end
end

puts dadate
