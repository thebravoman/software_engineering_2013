require 'csv'
require 'date'
first = Date.parse( ARGV[0])
last = Date.parse( ARGV[1])
razh=0.0
doh=0.0
CSV.foreach("bank.csv") do |row|
date = Date.parse(row[0])
if date >=first && date <=last
 doh=doh+row[1].to_f
 razh=razh+row[2].to_f
end
end
printf "%.2f,%.2f,%.2f", doh, razh, doh-razh

