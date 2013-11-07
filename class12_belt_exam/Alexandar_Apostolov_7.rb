require 'csv'
require 'date'

#Alexandar Apotolov, 11b, No.3, Task 3

filename = ARGV[0]
min_date = String.new("2999-01-01")
max_date = String.new("2000-01-01")
val = String.new()
min_name = String.new()
max_name = String.new()
r = Array.new()
i = 0

CSV.foreach(filename) do |row|
    val = row[2].split("_")
    #puts Date.parse(val[1])
    if Date.parse(max_date) < Date.parse(val[1])
        max_date = val[1]
        min_name = row[0].split("_")    
    end
    
    if Date.parse(min_date) > Date.parse(val[1])
        min_date = val[1]
        max_name = row[0].split("_")    
    end
    
end

CSV.open(filename.gsub(".csv","_result.csv"),"w") do |csv|
    csv << [min_name[1], min_date]
    csv << [max_name[1], max_date]
end

