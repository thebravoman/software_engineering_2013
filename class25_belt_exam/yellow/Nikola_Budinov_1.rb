require 'date'
require 'csv'

arr = Array.new
CSV.foreach(ARGV[0]) do |row|
        
        name = row[0].gsub("champ_", "")
        name = name.gsub("_", " ")
        row[0] = name                 
        date =  Date.parse row[2]
        row[2] = date
        arr << [name,date] 
end
        
arr = arr.sort_by{|a,b| b}
file = ARGV[0].gsub(".csv", "")

CSV.open("#{file}_result.csv", "w") do |csv|
        csv << arr[0]
        csv << arr[-1]
        csv << arr[1]
        
end
