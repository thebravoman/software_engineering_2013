require 'csv'
arr = []
a2 = []
CSV.foreach("strings.csv") do |row|
 arr << row
end

arr.each do |e|
 if e[0] == ARGV[0] || e[1] == ARGV[0] || e[2] == ARGV[0] || e[3] == ARGV[0] || e[4] == ARGV[0] || e[5] == ARGV[0] || e[6] == ARGV[0] || e[7] == ARGV[0] || e[8] == ARGV[0]
  a2 << e
 end
end

f = CSV.open("results2.csv","wb")
a2.each do |val|
  f << [val[0], val[1], val[2], val[3], val[4], val[5], val[6], val[7], val[8]]
end
f.close