require 'csv'

names = []
birthyear = []
i = 0
ime = String.new

 CSV.foreach("dogfest.csv") do |row|
  if  ARGV[0].to_s == row[4].to_s
   ime = row[4].strip << ' ' << row[5].strip 
   names << ime
   names << ARGV[1].to_i - row[3].to_i
   
  end
 
end

f = File.open("dogfest_owners_res.csv","w")

  while i != names.length
   f.write names[i].to_s + "," + names[i+1].to_s + "\n"
   i+=2
  end

f.close
