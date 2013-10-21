require 'csv'

CSV.open("results1.csv", "wb") do |csv|
        Dir.glob("*.rb") do |file|
                `copy #{file} Kristian_Popov_test_data`
                Dir.chdir "Kristian_Popov_test_data"
                            `ruby #{file} subs.srt #{file.gsub(".rb", ".txt")}`         
                            result = `diff #{file.gsub(".rb", ".txt")} subs_expected.txt`
                            result = result.gsub(/[\n\r]/,"")
                        if result == ""
                                csv << [file, result, 1]
                        else
                                csv << [file, result, 0]
                        end
                Dir.chdir ".."
                `rm -f Kristian_Popov_test_data/*_1.txt`
                `rm -f Kristian_Popov_test_data/*_1.rb`
        end
end
