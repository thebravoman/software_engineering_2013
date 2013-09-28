require 'csv'

bank_m1 = 0.00

CSV.foreach("bank.csv") do |row|
        bank_m1 = bank_m1 + row[1].to_f     
end

printf("%.2f",bank_m1)
