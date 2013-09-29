require "csv"

max_inc = 0.00
date = nil
s_date = nil

CSV.foreach("bank.csv") do |row|
    if row[1].to_f > max_inc
    	max_inc = row[1].to_f
    	date = row[0].to_s
    end
    if row[1].to_f == max_inc
    	s_date = row[0].to_s 
    end
end

if date != nil
	printf "%s", date
end
if s_date != nil
	printf "\n%s", s_date
end
