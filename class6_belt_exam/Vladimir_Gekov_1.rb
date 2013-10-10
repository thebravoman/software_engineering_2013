require 'csv'
require 'date'
 filename=ARGV[1]
 c=ARGV[1]
 vsichko=[]

CSV.foreach(filename) do |row|
  if row |1|<c
  vsichko<<row
  end 
end
 vsichko.each do |element|
 if element 2!=nil
  vsichko=vsihcko.sort {|a,b| a2<=>b2}
  end

 
 puts vsichko
 vsichko=vsichko.sort {|a,b| a2 <=> b2}

  topname=filename.split(" ")[0..1]
CSV.open ("#{filename[0]}_result.csv" ,"w") do |csv|
vsicko.each do |element|
  csv<<element
  
  end
end



