require "csv"


m1= 0.00
 
CSV.foreach "bank.csv" do |line|
  m1 += line[1].to_f
end

puts m1  
