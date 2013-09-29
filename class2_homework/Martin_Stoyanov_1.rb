require "csv"

income = 0.00
expense = 0.00

CSV.foreach("bank.csv") do |row|
    if(row[0].to_i>=ARGV[0].to_i) && (row[0].to_i<=ARGV[1].to_i)
        income=income+row[1].to_f
        expense=expense+row[2].to_f
    end
end
printf "%.2f, %.2f, %.2f", income, expense, income - expense
