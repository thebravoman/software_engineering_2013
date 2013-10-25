require 'csv'
all=Array.new(0)
splitter=0
splitter_min=0

CSV.foreach(ARGV[0]) do |row|	
next if row[0]=="Transaction_date"

	splitter=row[0]
	splitter_min=splitter.split(":")[1] 
	splitter=splitter.split(":")[0]	
	
	if ((splitter.to_i<=06) && (splitter_min.to_i<=20))
	 	all<< [row[0],row[1],row[2],row[3]]
	else
		next
	end
end

all=all.sort_by{|a,b,c,d|a}

CSV.open("sales_results.csv","w") do |csv|
	all.each do |row|
	 	csv << [row[0],row[1],row[2],row[3]]
	 end
end



