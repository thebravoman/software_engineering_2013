require 'csv'

all=Array.new




  CSV.foreach("bank.csv") do |row|
     first = row[4].split(" ")[0..1]
     if first[0]==ARGV[1]
     all.sort
     all << row
     end
 end
 

    CSV.open(ARGV[0].split(".")[0]+"_result.csv", "w") do |csv|
      all.each do |line|
      csv<<line
      end
 end

