require 'csv'


temp_arr = []
results = {}
line_num = 0
co = 0
check = 0
all = []
sum = 0

File.open(ARGV[0]).each do |line|
	line_num += 1
	work_line = line.strip
	co = 0 

	work_line.each_byte do |c|
		c = c.to_i - 48
		if c < 0 || c > 9
			check = 0
		else
			if check == 0 
				co += 1	
				if results[line_num] != nil
					results[line_num] = results[line_num].to_s + ' '
				end
			end
			if results[line_num] == nil
				results[line_num] = c.to_s
				temp_arr = c
			else
				results[line_num] = results[line_num] + c.to_s
			end
			check = 1
		end
	end
	co = 0
end

CSV.open("result_numbers.csv", "w") do |row|
		results.each do |element|
			row << element
		end
end
