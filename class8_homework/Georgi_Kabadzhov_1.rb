require 'csv'

Dir.chdir("Georgi_Kabadzhov_test_data")
original_subs = "subs.srt"
expected_result = "subs_expected.txt"
output = "out.txt"

Dir.chdir("../../class7_homework")

Dir.glob("*.rb").each do |file|
        if !(file =~ /test/)
                `cp #{file} ../class8_homework/Georgi_Ivanov_test_data`
        end
end

Dir.chdir("../class8_homework/Georgi_Kabadzhov_test_data")

CSV.open("results1.csv", "w") do |csv|
        Dir.glob("*.rb").each do |file|                                
                `ruby #{file} #{original_subs} #{output}`
                result = `diff #{output} #{expected_result}`
                `rm #{output}` 
                result = result.gsub(/[\n]/,"")

                name = file.split("_")[0..1]
                full_name = name[0] + " " + name[1]

                if result == ""
                        csv << [full_name, result, 1]
                else
                        csv << [full_name, result, 0]
                end
        end
end
