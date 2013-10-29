require 'csv'


`ruby #{ARGV[0]} names.csv`
name = ARGV[0].to_s.split("_")[0] + " " + ARGV[0].to_s.split("_")[1]
result=`diff result_names.txt expected_names.txt`
CSV.open("result_test_names.csv","w") do |csv|
       	csv << [name,result==""]
end
