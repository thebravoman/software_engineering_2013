require "csv"
def calculate_balance
 start_day = ARGV[0]
 end_day = ARGV[1]
 income = 0.00
 expence = 0.00
 CSV.foreach("bank.csv") do |row|
  if row[0] >= start_day and row[0] <= end_day then
   income = income + row[1].to_f
   expence = expence + row[2].to_f
  end
 end
 puts income.to_s+","+expence.to_s+","+(income-expence).to_s
end
calculate_balance
