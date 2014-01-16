require 'CSV'

array =[]

fname=ARGV[0]
class = row[1].split("/")
CSV.foreach("champs.csv") do |row|
	if ARGV[1] != row[1] || class[1] != ARGV[1]
               array[name] = row[3].to_i
        array << row
	end
end


array = array.sort_by{|array,array[1]| a}.reverse

fname=fname.gsub(".csv","")

CSV.open(fname + "champs_result.csv", "w") do |csv|
        arr.each do |element|
                csv << element
        end
end
