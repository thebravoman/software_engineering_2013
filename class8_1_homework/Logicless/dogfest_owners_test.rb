require 'csv'

`ruby #{ARGV[0]} dogfest_owners.rb Kiril 2013`
result=`diff -q dogfest_owners_res.csv dogfest_owners_expected.csv`
p result

CSV.open("result.csv","w") do |csv|
        csv << [ARGV[0],result==""]
end
