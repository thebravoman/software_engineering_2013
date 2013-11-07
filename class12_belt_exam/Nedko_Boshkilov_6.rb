require 'csv'
all=[]
CSV.foreach(ARGV[0]) do |row|
	if(row[3]==ARGV[1])
		all<<row
	end
end
all=all.sort{|a,b| a[1]<=>b[1]}
CSV.open("momicheta_result.csv","w") do |csv|
	all.each do |element|
		csv<<element
	end
end
