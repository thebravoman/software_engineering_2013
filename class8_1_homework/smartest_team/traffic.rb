require 'csv'
a = []

CSV.foreach(ARGV[0]) do |row|
time = row[1] + ":" + row[2]
a << [row[0],time] if row[1].include? ARGV[1]
end


CSV.open("traffic_results.csv", 'w') do |csv|
a=a.sort {|a,b| a[0]<=>b[0]}
a.each do |e|
csv << e
end
end
