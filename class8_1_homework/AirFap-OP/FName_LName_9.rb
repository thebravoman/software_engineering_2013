require 'csv'
k = 0
bl = 0
kl = 0
arr = []
a=[]
CSV.foreach("#{ARGV[1]}") do |row|
	bl+=row[0].to_i
	kl+=row[1].to_i
	k+= 1
	break if k == 10
end

a = []
ournum = bl - kl

CSV.foreach("#{ARGV[0]}") do |row|
	if row[1] != nil
		for i in 0..5
			row[i] = row[i].strip
		end	
	else 
		a = row
		next
	end
	row[3]= row[3].gsub(" km","")
	row[3] = row[3].to_i
	arr << row
end


if ARGV[2].to_i > ournum
	 arr = arr.sort{|a,b| a[1] <=> b[1]}
	arr << a 	
else 
	 arr = arr.sort{|a,b| a[3] <=> b[3]}	
end


CSV.open("FName_LName_9.csv","w") do |csv|
	arr.each do |element|	
		element[3] = element[3].to_s
		element[3] = element[3] + " km"
		csv << element
	end
end



