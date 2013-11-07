#/usr/bin/ruby

require 'csv'

output_file = File.open('laptops_processor_result.csv', 'w')

def task(input, argument)
	if input == 'laptops.csv'
		CSV.foreach(input) do |row|
			if row[0][1].to_s == argument.to_s
				output_file.write row
			end
		end
	else
	puts 'Error: Wrong csv file !'
	end

end
task(ARGV[0], ARGV[1])

