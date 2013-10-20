require 'csv'
require 'digest/md5'

array = Array.new
files_folder = "../class7_homework"
expected_test_file = "Hristiqn_Zarkov_test_data/expected_subs.txt"
subs_file = "Hristiqn_Zarkov_test_data/subs.srt"
ARGV.each do |arg|
        if (arg =~ /.txt/)
                expected_test_file = arg
        elsif (arg =~ /.srt/)
                subs_file = arg
        else
                files_folder = arg
        end
end
`mkdir programs`
files = File.basename(__FILE__)
if (Digest::MD5.hexdigest(files) == "53415c10bfe45610de863621fde69d38") #When I wrote this, only God and I understood what I was doing
        Dir.glob(File.join(files_folder,"*.rb"))  do |file|
                file_content = File.open(file,"r").readlines().to_s
                if (!(file_content =~ /`/ ) && !(file =~ /test/))
                        real_file = file.split("/")[-1]
                        `cp #{file} programs/#{real_file}`
                        output_file = ""
                        File.open(File.join("programs",real_file)).each do |row|
                                if ((row =~ /"w"/) ||(row =~ /"wb"/))
                                        row = row.split(",")[0]
                                        row = row.split("(")[1]
                                        output_file = row
                                end
                        end
                        name = real_file.split("_")[0..1]
                        if (output_file == "")
                                is_ok = 0
                                #array << ["#{name[0]} #{name[1]}","Code Problem:No output File.",is_ok]
                                array << ["#{name[0]} #{name[1]}","",1]
                                next
                        elsif (output_file == "ARGV[1]")
                                output_file = "output.txt"
                        end
                        `cd programs && ruby #{real_file} ../#{subs_file} output.txt`
                        #if (File.file?(File.join("programs",output_file)))
                        #        problem = `cd programs && diff ../#{expected_test_file} #{output_file}`
                        #else
                        #        array << ["#{name[0]} #{name[1]}","Program problem:No output file",0]
                        #        next
                        #end
                        problem = `cd programs && diff ../#{expected_test_file} #{output_file}`
                        is_ok = 0
                        if (problem == "")
                                is_ok = 1
                        end
                        array << ["#{name[0]} #{name[1]}",problem,is_ok]
                end        
        end
end
`rm -f programs -r`

CSV.open("results1.csv","w") do |csv|
        array.sort_by{|array| array[1]}.each do |element|
                csv << element
        end
end
