require 'csv'

filename = ARGV[0]
sum = {}
curr = []

CSV.foreach(filename) do |row|
	if row[4] =~ /[A-Z]+ /
		if (row[2] == nil)
			row[2] = 0
		end
		curr = row[4].split(" ")[0..1]
#		puts curr[0,1]
		sum[curr[0,1].to_s] = sum[curr[0,1]].to_i + row[2]

#		p row
	end
end

CSV.open(filename.gsub(".csv","") + "_results.csv").each do |csv|
	csv << ["BGN", sum["BGN"]]
	csv << ["EUR", sum["EUR"]]
	csv << ["USD", sum["USD"]]
	csv << ["HUV", sum["HUV"]]
end
