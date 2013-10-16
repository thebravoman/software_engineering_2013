require 'csv'

CSV.open("Nedelcho_Delchev_test_data/result.csv", "w") do |csv|
        Dir.glob("*.rb") do |program|
                next if program[0..3] == test
                `mkdir test`
                `ruby #{program} Nedelcho_Delchev_test_data/28.srt Nedelcho_Delchev_test_data/out.txt`
                result = `diff Nedelcho_Delchev_test_data/out.txt Nedelcho_Delchev_test_data/Nedelcho_Delchev.txt`
                result.gsub!(/[\n\r]/, "")
                if result == ""
                        csv << [file, result, true]
                else
                        csv << [file, result, false]
                end
        end
end