require 'csv'


`ruby #{ARGV[0]} fll.txt`
name = ARGV[0].to_s.split("_")[0] + " " + ARGV[0].to_s.split("_")[1]
result=`diff result_numbers.csv expected_numbers.csv`
CSV.open("result_test_numbers.csv","w") do |csv|
       	csv << [name,result==""]
end
