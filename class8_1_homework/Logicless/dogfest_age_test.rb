require 'csv'

`ruby #{ARGV[0]} dogfest_age.rb 5 7`
result=`diff -q dogfest_age_res.csv dogfest_age_expected.csv`

CSV.open("result.csv","w") do |csv|
        csv << [ARGV[0],result==""]
end
