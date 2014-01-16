require 'csv'

players = Array.new()

if ARGV[0] == nil
        count = 5
else
        count = ARGV[0].to_i
end

CSV.foreach("stats.csv") do |csv|
        players << csv
end

players.sort!{|a,b| b[0]<=>a[0]}
players.sort!{|a,b| b[1]<=>a[1]}
players = players.first(count)

CSV.open("top.csv", "w") do |csv|
        players.each do |stats|
                csv << stats
        end
end
