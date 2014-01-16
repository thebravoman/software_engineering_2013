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

arr = arr.sort_by{|a,b,c,d| d}
arr = arr.first(count)

CSV.open("top.csv", "w") do |csv|
        arr.each do |stats|
                csv << stats
        end
end
