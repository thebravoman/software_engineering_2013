File.open("result_subs.txt", "wb") do |text|
        Dir.glob("*_1.rb") do |file|
                        `copy #{file} Teodor_Draganov_Testing_Files`
                        Dir.chdir "Teodor_Draganov_Testing_Files"
                        begin
                                `ruby #{file} subs.srt #{file.gsub(".rb", ".txt")}` 
                                result = `diff subs.srt expected_subs.txt`
                                result = result.gsub(/[\n\r]/,"")
                                text << [file,result == ""]
                        rescue
                                result = "Exception for #{file}"
                                text << [file, false]
                        end
                        Dir.chdir ".."
                        `rm -f Teodor_Draganov_Testing_Files/*_1.txt`
                        `rm -f Teodor_Draganov_Testing_Files/*_1.rb`
        end
end
