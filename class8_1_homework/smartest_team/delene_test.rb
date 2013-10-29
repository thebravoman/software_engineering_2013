require 'csv'

`ruby #{ARGV[0]} delene.csv 50 100 3`
result=`diff -q delene_result.csv delene_expected.csv`

CSV.open("result.csv","w") do |csv|
        csv << [ARGV[0],result==""]
end
