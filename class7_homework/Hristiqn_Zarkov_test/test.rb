require 'csv'
CSV.open("results.csv","w") do |csv|
                `mkdir programs`
        Dir.glob(File.join("..","*.rb")) do |file|
                `cp #{file} programs/test.rb`
                `cd programs && ruby test.rb ../test_files/subs.srt output.txt`
                problem = `cd programs && diff ../test_files/expected_subs.txt output.txt`
                name = file[3..-1].split("_")[0..1]
                is_ok = false
                if (problem == "")
                        is_ok = true
                end
                csv << ["#{name[0]} #{name[1]}",problem,is_ok]
               
                
                `rm -f programs/test.rb`
        end
        `rm -f programs -r`
end
