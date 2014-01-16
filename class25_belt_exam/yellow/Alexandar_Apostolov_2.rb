require 'csv'

filename = ARGV[0]
clas = ARGV[1]
data = Array.new

CSV.foreach(filename) do |row|
	
	if row[1].to_s != clas.to_s
		row[0] = row[0].gsub("champ_","")
		data << [row[0], row[3]]
	end

end

data = data.sort_by{ |a,b| b.to_i }.reverse

CSV.open(filename.gsub(".csv","") + "_result.csv", "w") do |csv|
	data.to_a.each do |el|
		csv << el
	end
end
