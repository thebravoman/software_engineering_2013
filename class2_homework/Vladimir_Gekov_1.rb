require "csv"
require "date"

nachalo=Date.parse (ARGV[0])
krai=Date.parse (ARGV[1])

 prixod=0.00
 razxod=0.00

 CSV=foreach("bank.csv") do |row| 
  data=Date.parse (row[0])
   if (data>=nachalo) && (data<=krai) 
    prixod=prixod + row[1].to_f 
    razxod=razxod + row[2].to_f
   end
end
 
printf "%0.2f, %.2f, %.2f" ,prixod,razxod,prixod-razxod
