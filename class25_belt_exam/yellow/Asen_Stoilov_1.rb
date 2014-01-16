require "csv"
require "date"
big = ""
small = ""
bdate = ""
sdate = ""
big2 =""
b2date = "" 
t = ""


def create_name(row)
	name = row.split("_")
	name = name.drop(1)
	name = name.join(" ")	
	return name 
end

arr = []
CSV.foreach(ARGV[0], "r") do |row|
	t = row[2].slice(5,10)
	t = t.split("-")
	if bdate == ""
		bdate = Time.new(t[0],t[1],t[2])
	end
	if sdate == ""
		sdate = Time.new(t[0],t[1],t[2])
	end
	if bdate < Time.new(t[0],t[1],t[2])
		big = create_name(row[0]),t.join("-") 
		bdate = Time.new(t[0],t[1],t[2])
	end
	
	if sdate > Time.new(t[0],t[1],t[2])
		
		small = create_name(row[0]),t.join("-") 
		sdate = Time.new(t[0],t[1],t[2])
	end
	
	if b2date == ""
		b2date = Time.new(t[0],t[1],t[2])
	end
	if b2date < Time.new(t[0],t[1],t[2]) && bdate > Time.new(t[0],t[1],t[2])
		big2 = create_name(row[0]),t.join("-") 
		b2date = Time.new(t[0],t[1],t[2])
	end
	
end
 	
 	
 	arr << big
 	arr << small
 	arr << big2
 
 arr.sort_by! {|e| [e[0].to_s]}
 CSV.open("#{ARGV[0]}_result.csv","w") do |csv|
 	arr.each do |l|
 		csv << l
 	end
 end

