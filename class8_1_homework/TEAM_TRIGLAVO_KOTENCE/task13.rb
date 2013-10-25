require 'csv'

CSV.open("results.csv", "w") do |csv|
    Dir.glob("*_1.rb") do |file|
        begin
            result = system "ruby #{file}"
            if result
                result_file = Dir.glob("points_result.csv")[0]
                puts File.read(result_file)
                result = `diff #{result_file} points_expected.csv`
                result = result.gsub(/[\n\r]/,"")
            end
            csv << [file, result, result == ""]
        rescue Exception => e
            p e
            result = "Exception for #{file}"
            csv << [file, result, false]
        end
    end
end
