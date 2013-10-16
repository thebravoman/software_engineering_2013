require 'csv'
CSV.open("result.csv", "wb") do |csv|
        `mkdir VY_Test_Data`
        Dir.glob("*.rb") do |file|
                `cp #{file} VY_Test_Data`
                Dir.chdir "VY_Test_Data"
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
                `rm -f VY_Test_Data/#{file}`
                `rm -f VY_Test_Data/#{file.gsub(".rb", ".txt")}`
        end
        `rm -f VY_Test_Data/ -r`
end