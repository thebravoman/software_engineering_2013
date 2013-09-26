require "csv"

CSV.foreach("text_file.csv") do |row|
	puts row[1]
end

#~ f = File.open("text_file.csv")
#~ content = f.read
#~ content.each_line do |line|
	#~ puts line.split(",")[1]
# end
