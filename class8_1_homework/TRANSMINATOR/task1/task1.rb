require 'csv'
arr = []
CSV.foreach("strings.csv") do |row|
 arr << row
end

arr = arr.sort {   |x, y| x[ARGV[0].to_i] <=> y[ARGV[0].to_i] } 

f = CSV.open("results1.csv","wb")
arr.each do |val|
  f << [val[7], val[8]]
end
f.close