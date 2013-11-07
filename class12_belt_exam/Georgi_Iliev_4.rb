require 'csv'
proc=ARGV[1]
all = Array.new()
CSV.foreach(ARGV[0]) do |row|
	if (row[1]=proc)
	 all << row
	end 
end

CSV.open("laptops_processor_result.csv","w") do |csv|
     all.sort_by{|a,b,c,d,e,f| c}.each do |row|
      csv << [row[0],row[1],row[2],row[3],row[4],row[5]]
     end
end

