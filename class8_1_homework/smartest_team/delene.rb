require 'csv'
a = []

CSV.foreach(ARGV[0]) do |row|
if ARGV[1].to_i < ARGV[2].to_i
if row[0].to_i >= ARGV[1].to_i
if row[0].to_i <= ARGV[2].to_i
if row[0].to_i%ARGV[3].to_i == 0
a << [row[0].to_i]
end
end
end
end
end

CSV.open("#{ARGV[0].chomp(".csv")}_result.csv", "w") do |csv|
a=a.sort_by {|a,b| a}
a.each do |e|
csv << e
end
end
