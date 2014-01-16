require 'csv'
arr = []
all_the_single_ladies = []
CSV.foreach(ARGV[0]) do |row|
	if row[1].to_i == (ARGV[1].to_i-2)
		arr << row
	elsif row[1].to_i == (ARGV[1].to_i-1)
		arr << row
	elsif row[1].to_i == (ARGV[1].to_i)
		arr << row
	elsif row[1].to_i == (ARGV[1].to_i+1)
		arr << row
	elsif row[1].to_i == (ARGV[1].to_i+2)
		arr << row
	end		
end
arr.each do |row|
	if row[3].downcase == "SAMA".downcase
		all_the_single_ladies << row
	end
end

all_the_single_ladies.sort_by! { |a,b,c,d,e,f,g| b }

CSV.open("momicheta_result.csv", "w") do |io|
	all_the_single_ladies.each do |row|
		io << row
	end
end