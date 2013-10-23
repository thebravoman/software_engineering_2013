require 'csv'

`ruby #{ARGV[0]} Левски`
result=`diff Apfg_result.csv Apfg_res_control.csv`

CSV.open("Apfg_res.csv","w") do |csv|
        csv << [ARGV[0],result==""]
end


