require 'csv'
taka = []
nomer =  ARGV[1]
CSV.foreach(ARGV[0]) do |row|
	if row[4].to_s.include?(nomer)
			taka << row
	end		
end
taka=taka.sort_by { |a,b,c,d,e| b.to_i }

CSV.open("momicheta_result.csv", "w") do |io|
	taka.each do |row|
		io << row
	end
end
