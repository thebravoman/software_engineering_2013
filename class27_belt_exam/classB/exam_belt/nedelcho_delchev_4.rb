require 'csv'
require 'date'

arr = Array.new
arrr = Array.new
CSV.foreach(ARGV[0]) do |row|
        
        name = row[0].gsub("champ_", "")
        name = name.gsub("_", " ")
        row[0] = name                 
        date = Date.parse row[2]
        row[2] = date
        price = row[3]
        arr << [date,name,price]
end
        

file = ARGV[0].gsub(".csv", "")
arr = arr.sort_by{|a,b,c| c.to_i}
arr = arr.reverse

CSV.open("#{file}_result.csv", "w") do |csv|
       	csv << arr[0]
        csv << arr[-9]
        csv << arr[-1]
end
