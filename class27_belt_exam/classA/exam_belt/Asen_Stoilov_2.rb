require "csv"

def crname(row)
        name = ((row.split("_")).drop(1)).join(" ")
        return name
end
arr = []
clas = ARGV[1].to_s
CSV.foreach(ARGV[0],"r") do |row|
	if (row[1].include? clas) == false
		arr << [row[3].to_s,crname(row[0]),row[1].to_s]	
	end
end

arr = arr.sort_by! {|e| [e[1].to_s]}.reverse

CSV.open("#{ARGV[0].chomp(".csv")}_result.csv", "w") do |csv|
	arr.each do |l|
		csv << l
	end
end
