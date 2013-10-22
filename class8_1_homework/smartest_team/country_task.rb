require 'csv'
all=Array.new(0)

	CSV.foreach(ARGV[0]) do |row|
		if row[2]=="Proto Independent State"
			next if row[3]==nil
				if row[3].split(" ")[0]=="Republic"
					all<< [row[0],row[1],row[2],row[3]]
				end
		end
	end

all=all.sort_by{|a,b,c,d|a}

	CSV.open("country_results.csv","w") do |csv|
		all.each do |row|
			csv << [row[0],row[1],row[2],row[3]]
		end
	end
