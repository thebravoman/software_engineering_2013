File.open("result_subs.txt", "wb") do |text|
        Dir.glob("*_class7.rb") do |file|
                        begin
                                result = `diff subs.txt expected_subs.txt`
                                result = result.gsub(/[\n\r]/,"")
                                text << [result == ""]
                        rescue
                                result = "Exception for #{file}"
                                text << [file, false]
                        end
        end
end
