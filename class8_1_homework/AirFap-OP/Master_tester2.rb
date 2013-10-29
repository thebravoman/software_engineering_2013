require 'csv'
def file_comp(rightf,margv1,margv2) 
	CSV.open("Result_#{ARGV[0].gsub(".rb",".csv")}","w") do |csv|	
	
		begin
		@stname = ARGV[0].split("_")[0..1]
		@name = @stname[0] + " " + @stname[1]
		@resfname = ARGV[0].gsub(".rb",".csv")
		@check = system "ruby #{ARGV[0]} trains.csv #{margv1} #{margv2}"

		if @check
			File.read("#{@resfname}")
			@check = `diff #{@resfname} #{rightf}`
		end

		if @check == ""
			csv << [@name,"true"]
		else
			csv << [@name,"false"]
		end

		rescue Exception => e
			p e
			csv << [@name,"false"]
		end
		`rm #{@resfname}` 
		
	end
end

number = ARGV[0].split("_")[2].gsub(".rb","").to_i

case number

###Tester 8###

when 8
	i = 0
	arr = []
	CSV.foreach("randnums.csv") do |row|
		i+=row[0].to_i+row[1].to_i
	end
	CSV.foreach("trains.csv") do |row|
		if row[1] != nil
			row[1] = row[1].gsub("_"," ")
		end
		if i%2 == 0
			if row[0].to_i%2 ==0
				arr << row if row[3].strip.gsub(" km","").to_i > 200
			end
		else
			if row[0].to_i%2 !=0
				arr << row if row[3].strip.gsub(" km","").to_i > 200
			end
		end
	end
	arr = arr.sort{|a,b| a[2] <=> b[2]}
	CSV.open("testf_8.csv","w") do |csv|
		arr.each do |element|
			for i in 0..5
				element[i] = element[i].strip
			end		
			csv << element
		end
	end
	file_comp("testf_8.csv","randnums.csv",nil)
	`rm testf_8.csv`

###Tester 9###

when 9
	k = 0
	bl = 0
	kl = 0
	arr = []
	a=[]
	CSV.foreach("randnums.csv") do |row|
		bl+=row[0].to_i
		kl+=row[1].to_i
		k+= 1
		break if k == 10
	end

	a = []
	ournum = bl - kl

	CSV.foreach("trains.csv") do |row|
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


	if -200 > ournum
		 arr = arr.sort{|a,b| a[1] <=> b[1]}
		arr << a 	
	else 
		 arr = arr.sort{|a,b| a[3] <=> b[3]}	
	end

	CSV.open("testf_9.csv","w") do |csv|
		arr.each do |element|	
			element[3] = element[3].to_s
			element[3] = element[3] + " km"
			csv << element
		end
	end

	file_comp("testf_9.csv","randnums.csv","-200")	
	`rm testf_9.csv`
	
###Tester 10###

when 10
	costeff = []
CSV.foreach("trains.csv") do |row|
	if row[1] != nil && row[1].strip == "Centralna_gara" 
		row[3] = row[3].gsub(" km","")
		row[5] = row[5].gsub(" lv","")
		costeff << [row[0],row[3].to_f/row[5].to_f]
	end
end

costeff = costeff.sort{|a,b| b[1] <=> a[1]}
i = 0
CSV.open("testf_10.csv","w") do |csv|
	costeff.each do |element|
		csv << [element[0]]
		i+=1
		break if i == 3
	end
end	
	file_comp("testf_10.csv","randnums.csv",nil)
	`rm testf_10.csv`

###Tester 11###

when 11
	tow = []

	CSV.foreach("trains.csv") do |row|

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

	CSV.open("testf_11.csv","w") do |csv|
		tow.each do |element|
			csv << element
		end
	end
	
	
	file_comp("testf_11.csv","randnums.csv",nil)
	`rm testf_11.csv`

###Tester 12###

when 12
	money = 0
	h = 0
	min = 0
	dist = 0
	i = 0
	CSV.foreach("trains.csv") do |row|
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

	CSV.foreach("randnums.csv") do |row|
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

	CSV.open("testf_12.csv","w") do |csv|
		a.each do |element|
			csv << element
		end
	end

	file_comp("testf_12.csv","randnums.csv",nil)
	`rm testf_12.csv`
end
