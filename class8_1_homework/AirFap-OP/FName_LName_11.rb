require 'csv'
tow = []

CSV.foreach("#{ARGV[0]}") do |row|

	gohmin = row[2].strip.split(":")[0..1]
	needhmin = row[4].split(":")[0..1]
	min = gohmin[1].to_i + needhmin[1].to_i
	h = gohmin[0].to_i + needhmin[0].to_i

	if min >= 60 
		min-=60
		h+=1
	end

	if h>=24
		h-=24
	end

	if min < 10 
	min = min.to_s
	min = "0"+min
	end
	
	if h<10
		h = h.to_s
		h = "0" + h
		tow << [row[1].strip.gsub("_"," "),h+":"+min.to_s]
	elsif h<16
		tow << [row[1].strip.gsub("_"," "),h.to_s+":"+min.to_s]
	end

end

CSV.open("FName_LName_11.csv","w") do |csv|
	tow.each do |element|
		csv << element
	end
end
	
