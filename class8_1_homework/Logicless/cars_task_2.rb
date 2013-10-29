#/usr/bin/ruby

require 'csv'

 old_cars = 0
 new_cars = 0

CSV.foreach("cars.csv", "r") do |row|
c = row[3] 
v = ARGV[0]

if c < v
    old_cars += 1
end
if c >= v
    new_cars += 1  
end

info = File.open("Info.txt", "w")
info.puts "Koli prozvedeni predi ",v," godina ", old_cars,"Koli proizvedeni sled ",v," godina vkl", new_cars
info.close
end
