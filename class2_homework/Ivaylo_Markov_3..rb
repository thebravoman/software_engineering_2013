require 'csv'


win = 0.00
mdate = ""

CSV.foreach('bank.csv') do |line| 
	if line[1].to_f > win
		win = line[1].to_f
		mdate = line[0]
	end
end

puts mdate
