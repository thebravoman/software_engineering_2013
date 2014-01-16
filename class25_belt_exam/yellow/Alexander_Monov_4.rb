#usr/bin/ruby

require 'csv'
require 'date'

minscore = ARGV[1].to_i
if ARGV[2].nil? == true
        count = 5
else count = ARGV[2].to_i
end
players = []

CSV.foreach(ARGV[0].to_s) do |row|
        row[1] = row[1].to_i
        if row[1].to_i > minscore
                players << row
        end
end

players.sort! {|a,b| a[6] <=> b[6]}


CSV.open("top.csv","w") do |csv|
        count.times do |n|
                csv << players[n]
        end
end
