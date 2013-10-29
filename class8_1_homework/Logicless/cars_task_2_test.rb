#/usr/bin/ruby

require 'csv'

`ruby #{ARGV[0]} cars_task_2.rb 2005`
result=`diff -q Info.txt cars_task_2_expected.txt`

CSV.open("result.csv","w") do |csv|
        csv << [ARGV[0],result==""]
end
