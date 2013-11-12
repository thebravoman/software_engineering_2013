require 'csv'


sz=ARGV[1]
arr=[]

CSV.foreach(ARGV[0]) do |row|

	if row[3]==sz
		arr<<[row[0],row[1].to_i,row[2],row[3],row[4]]
	end
end

p arr
arr=arr.sort_by{|a,b,c,d,e| b}

CSV.open("momicheta_result.csv","w") do |csv|

	arr.each do |element|
	  csv<<element
	end
end
