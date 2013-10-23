require 'csv'

`ruby #{ARGV[0]} transport.csv`
result=`diff transport_result.csv transport_expected.csv`

CSV.open("result.csv","w") do |csv|
        csv << [ARGV[0],result==""]
end



