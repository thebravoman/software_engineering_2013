require 'csv'
arr = []
CSV.foreach("strings.csv") do |row|
 arr << row
end
colnum = 0
arr.each do |e|
	if e[0] == ARGV[0]
		colnum = 0
		break
	end
	if e[1] == ARGV[0]
		colnum = 1
		break
	end
	if e[2] == ARGV[0]
		colnum = 2
		break
	end
	if e[3] == ARGV[0]
		colnum = 3
		break
	end
	if e[4] == ARGV[0]
		colnum = 4
		break
	end
	if e[5] == ARGV[0]
		colnum = 5
		break
	end
	if e[6] == ARGV[0]
		colnum = 6
		break
	end
	if e[7] == ARGV[0]
		colnum = 7
		break
	end
	if e[8] == ARGV[0]
		colnum = 8
		break
	end
end
arr = arr.sort {   |x, y| x[colnum] <=> y[colnum] }

f = CSV.open("results4.csv","wb")
arr.each do |val|
  f << [val[0], val[1], val[2], val[3], val[4], val[5], val[6], val[7], val[8]]
end
f.close