#/usr/bin/ruby

require 'csv'

`ruby #{ARGV[0]} cars_task_3.rb cars.csv B`
result=`diff -q car_sort.csv cars_task_3_expected.csv`

CSV.open("result.csv","w") do |csv|
        csv << [ARGV[0],result==""]
end
