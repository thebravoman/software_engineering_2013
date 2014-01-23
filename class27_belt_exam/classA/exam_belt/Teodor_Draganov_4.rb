require 'csv'
require 'date'

arr = Array.new
CSV.foreach(ARGV[0]) do |row|
        
        name = row[0].gsub("champ_", "")
        name = name.gsub("_", " ")
	price = row[3].to_i               
        date = Date.parse row[2]
        arr << [name,date,price]
end
        
arr = arr.sort_by{|a,b,c| b}
puts arr
file = ARGV[0].gsub(".csv", "")

CSV.open("#{file}_result.csv", "w") do |csv|
        csv << arr[0]
        csv << arr[9]
	csv << arr[-1]        
end 
