#/usr/bin/ruby

require 'csv'

bmw = 0
ren = 0
vol = 0
n = 0

CSV.foreach("cars.csv", "r") do |row|	
b = row[1] 
a = ARGV[0]
 
if b == a
    n += 1
end

if b == "Bmw"
    bmw += 1
end

if b =="Renault"
    ren += 1
end

if b =="Volkswagen"
    vol += 1 
end

info = File.open("cars_info.txt", "w")
info.puts "BMW = ", bmw,"Renault = ", ren,"Volkswagen = " ,vol,"Vuvedena marka " ,a,"broi avtomobili " ,n
info.close

end
