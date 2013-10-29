require 'csv'

i =0
name = ""
all = []
names = []

while i!= (ARGV.length)
 if ARGV[i] != nil
  names << ARGV[i]
 end
 i+=1
end

for i in 0..names.length-1 do
 names[i] = names[i].downcase
 names[i][0] = names[i][0].upcase
 name += names[i] + " "
end
name[name.length-1] = ''

CSV.foreach("dogfest.csv") do |r|
 if r[2] == name
  all << r
 end
end

all = all.sort
CSV.open("dogfest_breeds_res.csv", "w" ) do |c|
 all.each do |e|
  c << e
 
 end
end
