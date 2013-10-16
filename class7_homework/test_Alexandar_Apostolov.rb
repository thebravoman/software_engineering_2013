require 'csv'

CSV.open("result.csv", "wb") do |csv|
        `mkdir Test_Folder`
        Dir.glob("*.rb") do |file|
                `cp #{file} Test_Folder`
                Dir.chdir "Test_Folder"
                begin
                            result = system "ruby #{file} #{ARGV[0]}"
                                if result
                                        result = `diff #{file.gsub(".rb", ".txt")} #{ARGV[1]}`  
                                        result = result.gsub(/[\n\r]/,"")
                                end
                            csv << [file, result, result == " "] 
                rescue
                            result = "Exception for #{file}"
                            csv << [file, result, false]
                end
                Dir.chdir ".."
                `rm -f Test_Folder/#{file}`
                `rm -f Test_Folder/#{file.gsub(".rb", ".txt")}`
        end
        `rm -f Test_Folder/ -r`
end
