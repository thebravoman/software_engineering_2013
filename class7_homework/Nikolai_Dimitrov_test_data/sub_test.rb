require 'csv'

CSV.open("results.csv","w") do |csv|
        Dir.glob("*_1.rb") do |file|
                `ruby#{ARGV[0]}`
                result= `diff subs.txt subs_expected.txt`
                result= result.gsub(/[\n\r]/,"")
                if (results == "")
                        csv << [file, result, true]
                else
                        csv << [file, result, false]
                end
        end
end