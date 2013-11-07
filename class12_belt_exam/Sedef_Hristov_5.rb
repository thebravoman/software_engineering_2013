require "csv"
require "date"
a = ARGV[1]
cs = ARGV[2]



CSV.foreach(ARGV[0]) do |row|
 r = row[1].to_s
if row[1] > r
    k = row[1]
   else
    k = r
  end
b = File.open(ARGV[3], "w")
b.print k, ARGV[1]
 
end

b = File.open(ARGV[2], "w")
b . print 



