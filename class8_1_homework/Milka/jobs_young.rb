require 'csv'

array = Array.new()
CSV.foreach(ARGV[0]) do |row|
	if row[1].to_i <= 30
		array << row
	end
end
array.sort!{|a,b| b[3].to_f <=> a[3].to_f}
CSV.open("jobs_young_result.csv","w") do |csv|
	array.each do |element|
	csv << element
	end
end


