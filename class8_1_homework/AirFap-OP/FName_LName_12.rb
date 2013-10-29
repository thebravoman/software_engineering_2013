require 'csv'
money = 0
h = 0
min = 0
dist = 0
i = 0
CSV.foreach("#{ARGV[0]}") do |row|
	money+=row[5].gsub(" lv","").to_i
	hmin= row[4].split(":")[0..1]
	h+= hmin[0].to_i
	min+= hmin[1].to_i
	if min > 60
		h+=1
		min-=60
	end
	dist+=row[3].gsub(" km","").to_i
end

randnum = 0

CSV.foreach("#{ARGV[1]}") do |row|
	if i == 6 
		randnum = row[0].to_i
		break
	end
	i+=1
end
pr = true
k = 0

for i in 1..randnum
	if randnum%i == 0
	    if k ==3
			pr = false 
			break
		end		
		k+=1  
	end 
end

a = []
if pr == true
	a << [h.to_s+":"+min.to_s,money.to_s+" lv"]
else
	a << [dist.to_s+" km",money.to_s+" lv"]
end

CSV.open("FName_LName_12.csv","w") do |csv|
	a.each do |element|
		csv << element
	end
end
