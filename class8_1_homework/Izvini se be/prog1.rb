require 'csv'

diff = 0
trigger = 0
length = 0
converted_diff = ""

CSV.open(ARGV[0], "r").each do |row|
	if trigger == 2
		if row[1] != ARGV[2]
			length = (diff.to_s).length
			converted_diff = diff.to_s
			File.open("#{converted_diff[length-1]}.txt", "w") do |file|
				file << diff
			end
		else
			diff = diff + (row[2].to_f - row[3].to_f)
		end
	elsif trigger == 1
		diff = diff + (row[2].to_f - row[3].to_f)
	end
	if row[1] == ARGV[1]
		diff = diff + (row[2].to_f - row[3].to_f)
		if trigger != 1
			trigger = 1
		end
	elsif row[1] == ARGV[2]
		if trigger != 2
			trigger = 2
		end
	end
end
