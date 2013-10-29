require 'csv'

`ruby #{ARGV[0]} zad_2.csv`
result=`zad_2_result.csv zad_2_result_expected.csv`

CSV.open("result.csv","w") do |csv|
        csv << [ARGV[0],result==""]
end
