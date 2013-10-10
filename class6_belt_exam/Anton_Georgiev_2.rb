require 'csv'
valuta = []
result = []

CSV.foreach(ARGV[0]) do |row|
   valuta << [row[5],row[3]]
end
result.each do |element|
  valuta.each do |e|
  if elemnt[0]==nil && element[0]!=e[0]
    element[0]=e[0]
    element[1]=e[1]
  end
   if element[0]==e[0]
      element[1]+=e[0]
   end
  end
end

result=result.sort {|a.b| a[1] <=> b[1]}

name=ARGV[0].chomp(".csv")
CSV.open("#{name}_result.csv","w") do |csv|
  result.each do |element|
    csv << element
  end
end
