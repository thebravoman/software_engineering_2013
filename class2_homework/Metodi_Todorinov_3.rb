require 'csv'

biggest_i = 0.00

CSV.foreach('bank.csv') do |line|
         if line[1].to_f > biggest_i
		       biggest_i = line[1].to_f
	     end
		
end
printf '%0.2f", biggest_i
