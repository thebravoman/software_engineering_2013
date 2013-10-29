require "csv"
def calculate_m1
 m1 = 0.00
 CSV.foreach("bank.csv") do |row|
  m1 = m1+row[1].to_f
 end
 puts m1
end
calculate_m1
