require 'csv'

array=Array.new()
age_1=ARGV[2]
age_2=ARGV[3]
CSV.foreach(ARGV[0]) do |row|
	if row[1] >= age_1 && row[1] <= age_2 && row[2] == ARGV[1]
	array << [row[0],row[3]]
	end
end
array.sort!{|a,b| b[1].to_f<=>a[1].to_f}
CSV.open("work_ages_result.csv","w") do|csv|
array.each do |element|
csv << element

end
end
