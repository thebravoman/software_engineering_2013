require 'csv'

`ruby #{ARGV[0]} dogfest_breeds.rb pointer`
result=`diff -q dogfest_breeds_res.csv dogfest_breeds_expected.csv`

CSV.open("result.csv","w") do |csv|
        csv << [ARGV[0],result==""]
end
