require 'csv'
i=0
sum=0
age=0
array = Array.new()
CSV.foreach(ARGV[0]) do |row|
	if ARGV[1] == row[2]
		array << row		
		i+=1
		sum+=row[3].to_f
		age+=row[1].to_i
	end
end
sum = sum/i
age = age/i

array.sort!{|a,b| a[3].to_f <=> b[3].to_f}
array << [age,sum.round(2)]
CSV.open("jobs_info_result.csv","w") do |csv|
	array.each do |element|
	csv << element
	end

end
