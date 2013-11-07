require 'csv'

all = []
CSV.foreach(ARGV[0]) do |row|
        if (row[1].to_s.downcase == ARGV[1].downcase)
                all << row
        end 
end

all = all.sort_by{|a,b,c,d,e,f| c}
CSV.open("laptops_processor_result.csv","w") do |csv|
        all.each do |row|
                csv << row
	end
end

