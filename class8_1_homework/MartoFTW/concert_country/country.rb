require 'csv'

all = []
CSV.foreach(ARGV[0]) do |row|
        if (row[2].to_s.downcase == ARGV[1].downcase)
                all << row
        end 
end
all = all.sort_by{|a,b,c,d,e,f| a}
CSV.open("country_result.csv","w") do |csv|
        all.each do |row|
                csv << row
	end
end


