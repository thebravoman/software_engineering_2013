require 'csv'
a=7
`ruby #{ARGV[0]} 7`
result=`diff Apfg2_result.csv Apfg2_res_control.csv`

CSV.open("Apfg2_res.csv","w") do |csv|
        csv << [ARGV[0],result==""]
end

