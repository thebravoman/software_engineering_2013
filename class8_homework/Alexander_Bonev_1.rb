require 'csv'
Dir.chdir("../class7_homework")

        Dir.glob("*_1.rb") do |file|
                if !(file =~/test/)
                        `cp #{file} ../class8_homework/Alexander_Bonev_test_data`
                end        
        end
Dir.chdir("../class8_homework/Alexander_Bonev_test_data")
CSV.open("results1.csv", "w") do |csv|
    Dir.glob("*.rb") do |file|
        begin
        `mkdir test_execution`
        `cp #{file} test_execution`
        `cd test_execution && ruby #{file} subs.srt`

        result = `diff test_execution/out.txt Alexander_Bonev_test_data/expected.txt`

        result = result.gsub(/[\n\r]/,"")
        `rm test_execution/*`
        name=file.gsub(/.rb/,"")
        name=name.split("_")[0..1]
        p_name=name[0] + " " + name[1]

                csv << [p_name,result == ""]
        rescue
            result = "Exception for #{file}"
            csv << [file, result, 0]
         
        end
    end
end          rescue
                        result = "Exception for #{file}"
                        csv << [file, result, 0]
                
                
                
                
                end
        end
end