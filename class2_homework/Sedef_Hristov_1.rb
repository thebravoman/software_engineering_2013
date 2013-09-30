require "csv"
require "date"

 a = Date.parse(ARGV[0])
 b = Date.parse(ARGV[1])

exp = 0.00
inc = 0.00
bal = 0.00

CSV.foreach("bank.csv") do |row|
c = Date.parse(row[0])

if c >= a && c <= b

inc=inc+row[1].to_f
exp=exp+row[2].to_f
bal=inc-exp.to_f

end
end

printf("%0.2f,%0.2f,%0.2f",inc,exp,bal)
