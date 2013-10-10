#Task 2
require 'csv'
sum_debit=Hash.new {0}
valuta=Hash.new{0}

CSV.foreach(ARGV[0]) do |row|
CSV.open("bank_results.csv","w+") do |csv|



sum_debit[row[2].to_f] << sum_debit[row[2].to_f] + row[2].to_f #sbor na debit
valuta[row[4]]=valuta[row[4]].to_s



sum_debit.each do |elements|

csv << [sum_debit[row[2]],row[4].to_s]

end

end
end


#end
