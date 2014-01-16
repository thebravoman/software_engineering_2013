require 'csv'

arr = Array.new()

if ARGV[0] == nil 
        count = 3
else 
        count = ARGV[0].to_i
end

CSV.foreach("stats.csv") do |csv|
        arr << csv
end

arr.sort!{|a,b| b[0]<=>a[0]}
arr.sort!{|a,b| b[1]<=>a[1]}
arr = arr.first(count)

CSV.open("top.csv", "w") do |csv|
        arr.each do |stats|
                csv << stats
        end
end
