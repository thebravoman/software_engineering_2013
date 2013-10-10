require 'csv'
a = Array.new

CSV.foreach(ARGV[0]) do |row|
test = row[4].split(" ")[0..1]
	if test[0] == ARGV[1]
	a.sort
	a << row
	end
	end
CSV.open(ARGV[0].split(".")[0]+"_result.csv", "w") do |csv|
a.each do |line|
csv<<line
end
end

