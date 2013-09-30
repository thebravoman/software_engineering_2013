require 'csv'

a=Hash.new{0}

        CSV.foreach("bank.csv") do |row|

            a[row[0]]=a[row[0]]+row[1].to_f

        end

puts (a.max_by{|data,prihod|prihod})[0]
