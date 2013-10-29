require "csv"

all= Array.new()
inp=ARGV[1].to_i
s=0
CSV.foreach(ARGV[0],"r") do |row|
s=row[1].to_i
all<<[row[0],s*inp]
end

all.sort_by{ |a,b| b}

CSV.open("zad_2_result.csv","wb") do |csv|
 all.sort_by{ |a,b| b}.each do |l|
  csv << [l[0],l[1]]
  end
end
 

