require 'csv'

den=[]
CSV.foreach(ARGV[0]) do |row|
	if ARGV[1]==row[0]
		den << [row[1],row[2]]
	end
end

den.each do |element|
	if element[1].split("-")[0].to_i>element[1].split("-")[1].to_i
		element[0]=element[0].split("-")[0]
		element[1]=element[1].split("-")[0].to_i
	else
		element[0]=element[0].split("-")[1]
		element[1]=element[1].split("-")[1].to_i
	end
end

den.sort!{|a,b| b[1] <=> a[1]}

CSV.open("date_win_result.csv","w") do |csv|
	den.each do |element|
		csv << element
	end
end
