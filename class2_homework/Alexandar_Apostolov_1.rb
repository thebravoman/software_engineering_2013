require "csv"
require "date"

f_date = DateTime.strptime(ARGV[0], "%d/%m/%y")
s_date = DateTime.strptime(ARGV[1], "%d/%m/%y")

inc = 0.00
exp = 0.00

CSV.foreach("bank.csv") do |row|
	curr_date = DateTime.strptime(row[0], "%d/%m/%y")
    if ( curr_date >= f_date ) && ( curr_date <= s_date )
        inc = inc + row[1].to_f
        exp = exp + row[2].to_f
    end
end

printf "%.2f, %.2f, %.2f", inc, exp, inc - exp
