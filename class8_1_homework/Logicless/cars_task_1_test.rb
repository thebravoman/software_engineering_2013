#/usr/bin/ruby

require 'csv'

`ruby #{ARGV[0]} cars_task_1.rb Opel`
result=`diff -q cars_info.txt cars_task_1_expected.txt`

CSV.open("result.csv","w") do |csv|
        csv << [ARGV[0],result==""]
end
