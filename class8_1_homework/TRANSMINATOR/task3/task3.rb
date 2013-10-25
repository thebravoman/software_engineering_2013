require 'csv'
arr = []
a2 = {}
a3 = []
CSV.foreach("strings.csv") do |row|
 arr << row
end



arr.each do |e|
	a2[   e[   ARGV[0].to_i    ]   ]  =  0
end

arr.each do |e|
	a2.each do |key, val|
		for i in 0...9
			if e[i] == key && ARGV[0].to_i != i
				a3 << e
				next
			end
		end
	end
end


f = CSV.open("results3.csv","wb")
a3.each do |val|
  f << [val[0], val[1], val[2], val[3], val[4], val[5], val[6], val[7], val[8]]
end
f.close