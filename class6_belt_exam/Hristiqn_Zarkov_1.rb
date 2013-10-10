require 'csv'

all = Array.new()
CSV.foreach(ARGV[0]) do |row|
        val = row[4].split(" ")
        if (val[0] == ARGV[1])
                all << [row[0],row[1],row[2],row[3],row[4],row[5]]
        end 
end
CSV.open("bank_result.csv","w") do |csv|
        all.sort_by{|a,b,c,d,e,f| c}.each do |row|
                csv << [row[0],row[1],row[2],row[3],row[4],row[5]]
        end
end
