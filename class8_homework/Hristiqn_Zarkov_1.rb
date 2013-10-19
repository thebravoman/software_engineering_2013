require 'csv'
require 'digest/md5'

array = Array.new
test_date = "Hristiqn_Zarkov_test_date"
files_folder = "../class7_homework"
if (ARGV[0])
        files_folde = ARGV[0]
end
`mkdir programs`
files = File.basename(__FILE__)
if (Digest::MD5.hexdigest(files) == "53415c10bfe45610de863621fde69d38")
        Dir.glob(File.join(files_folder,"*.rb"))  do |file|
                file_content = File.open(file,"r").readlines().to_s
                if (!(file_content =~ /`/ ) && !(file =~ /test/))
                        `cp #{file} programs/test.rb`
                        output_file = ""
                        File.open(File.join("programs","test.rb")).each do |row|
                                if (row =~ /"w"/)
                                        row = row.split(",")[0]
                                        row = row.split("(")[1]
                                        output_file = row
                                end
                        end
                        name = file.split("/")[-1]
                        name = name.split("_")[0..1]
                        if (output_file == "")
                                is_ok = 0
                                #array << ["#{name[0]} #{name[1]}","No output File.",is_ok]
                                array << ["#{name[0]} #{name[1]}","",1]
                                next
                        elsif (output_file == "ARGV[1]")
                                output_file = "output.txt"
                        end
                        `cd programs && ruby test.rb ../#{test_date}/subs.srt output.txt`
                        #if (File.file?(File.join("programs",output_file)))
                        #        problem = `cd programs && diff ../#{test_date}/expected_subs.txt #{output_file}`
                        #else
                        #        array << ["#{name[0]} #{name[1]}","Compilation Fail",0]
                        #        next
                        #end
                        problem = `cd programs && diff ../#{test_date}/expected_subs.txt #{output_file}`
                        is_ok = 0
                        if (problem == "")
                                is_ok = 1
                        end
                        array << ["#{name[0]} #{name[1]}",problem,is_ok]
                p "#{name[0]} #{name[1]}"
                        
                end        
                `rm -f programs/test.rb`
        end
end
`rm -f programs -r`

CSV.open("results.csv","w") do |csv|
        array.sort_by{|array| array[1]}.each do |element|
                csv << element
        end
end
