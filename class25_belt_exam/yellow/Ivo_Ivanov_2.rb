require 'csv'
arr = Array.new()
if ARGV[1] == nil 
        num = 3
else 
        num = ARGV[1].to_i
end
CSV.foreach(ARGV[0]) do |csv|
        arr << csv
end
arr.sort!{|a,b| b[0]<=>a[0]}
arr.sort!{|a,b| b[1]<=>a[1]}
arr = arr.first(num)
CSV.open("champs_result.csv", "w") do |csv|
        arr.each do |el|
                csv << el
        end
end
