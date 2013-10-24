require 'csv'
costeff = []
CSV.foreach("#{ARGV[0]}") do |row|
	if row[1] != nil && row[1].strip == "Centralna_gara" 
		row[3] = row[3].gsub(" km","")
		row[5] = row[5].gsub(" lv","")
		costeff << [row[0],row[3].to_f/row[5].to_f]
	end
end

costeff = costeff.sort{|a,b| b[1] <=> a[1]}
i = 0
CSV.open("FName_LName_10.csv","w") do |csv|
	costeff.each do |element|
		csv << [element[0]]
		i+=1
		break if i == 3
	end
end	
