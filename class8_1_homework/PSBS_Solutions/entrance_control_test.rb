require 'csv'

`ruby #{ARGV[0]} entrance_control.csv 2013/10/11 2013/09/15`
result=`diff entrance_control_result.csv entrance_control_expected_result.csv`

CSV.open("result.csv","w") do |csv|
        csv << [ARGV[0],result==""]
end


