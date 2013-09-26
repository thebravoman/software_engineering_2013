require 'csv'

win = 0.00

CSV.foreach('bank.csv') do |line| 
	if line[1].to_f > win
		win = line[1].to_f
	end
end
printf "%0.2f", win
