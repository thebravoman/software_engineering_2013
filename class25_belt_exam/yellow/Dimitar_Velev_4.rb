require 'csv'
arr=Array.new()
if ARGV[0] == nil
        num = 5
else
        num = ARGV[0].to_i
end

CSV.foreach("stats.csv") do |row|
	arr<< row
end
arr.sort!{|a,b| b[0]<=>a[0]}
arr.sort!{|a,b| b[1]<=>a[1]}
arr = arr.first(num)
CSV.open("top.csv", "w") do |csv|
        arr.each do |el|
                csv << el
        end
end
