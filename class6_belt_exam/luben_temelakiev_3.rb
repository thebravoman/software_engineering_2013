require 'csv'
all = []
n = []
debit = gets
CSV.foreach(ARGV[0]) do |row|
	if row[2] == ''
	all << [row [2]]
	end
	end

all.sort_by {|a,b|b}
CSV.open("bank_result.csv", "wb") do |csv|

if row[2].to_f > debit.to_f
	all << [row[2]]
	end

end
