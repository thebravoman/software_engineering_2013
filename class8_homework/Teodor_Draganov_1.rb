require 'csv'

CSV.open("results1.csv", "wb") do |csv|
        Dir.glob("*.rb") do |file|
                `copy #{file} Teodor_Draganov_Testing_Files`
                Dir.chdir "Teodor_Draganov_Testing_Files"
                            `ruby #{file} subs.srt #{file.gsub(".rb", ".txt")}`         
                            result = `diff #{file.gsub(".rb", ".txt")} subs_expected.txt`
                            result = result.gsub(/[\n\r]/,"")
                        if result == ""
                                csv << [file, result, 1]
                        else
                                csv << [file, result, 0]
                        end
                Dir.chdir ".."
                `rm -f Тeodor_Draganov_Testing_Files/*.txt`
                `rm -f Тeodor_Draganov_Testing_Files/*.rb`
        end
end
