require "csv"

inc = 0.00
exp = 0.00

CSV.foreach("bank.csv") do |row|
    if ( row[0].to_i >= ARGV[0].to_i ) && ( row[0].to_i <= ARGV[1].to_i )
        inc = inc + row[1].to_f
        exp = exp + row[2].to_f
    end
end

printf "%.2f, %.2f, %.2f", inc, exp, inc - exp
