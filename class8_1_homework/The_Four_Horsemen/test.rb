def strip_file(read_file_name,write_file_name)
        rows_info = []
        File.open(read_file_name,"r").each do |row|
                rows_info << row.strip
        end
        File.open(write_file_name,"w") do |file|
                rows_info.each do |element|
                        file << element
                end
        end
end
programs_arguments_file = "Read_files/programs_arguments.txt"
ARGV.each do |arg|
        if (arg =~ /programs_arguments.txt/)
                programs_arguments_file = arg
        end
end
file_name = ARGV[0]
program_info = ""
info = []
problem = ""
is_ok = false
File.open(programs_arguments_file,"r").each do |line|
        program = line.split("-->")[0..1]
        if (program[0].strip == file_name.split(".")[-2].split("_")[-1])
                program_info = program[1]
        end
end
output_file = "output_"+file_name.split("_")[-1].split(".")[0]+".csv"
expected_file = "expected_files/"+"Task_"+file_name.split("_")[-1].split(".")[0]+"_result_expected.csv"
arguments = program_info.split("->")[0];
`mkdir program`
`cp #{file_name} program/test.rb`
`ruby program/test.rb #{arguments}`
if(!File.file?(output_file))
        File.open("test.rb","r").each do |row|
                if (row =~ /#{output_file}/)
                        problem = "Output file was created but test can't found it."
                else
                        problem = "Not created or wrong name for output file."
                end
        end
else
        problem = `diff #{output_file} #{expected_file}`
        if (problem == "")
                problem = "No"
                is_ok = true
        else
                strip_file(output_file,output_file)
                ex_file_second = expected_file.split(".")
                ex_file_seconda = ""
                for i in 0..ex_file_second.length-2
                        ex_file_seconda = ex_file_second[i]
                end
                ex_file_second = ex_file_seconda + "_second" + ex_file_second[-1]
                strip_file(expected_file,ex_file_second)
                problem = `diff #{output_file} #{ex_file_second}`
                if (problem == "")
                        problem = "Diff problem:syntax error";
                else
                        problem = "diff problem:unknow";
                end               
                `rm -f #{ex_file_second}`
        end
end
`rm -f program -r`
`rm -f #{output_file}`
#name = file_name.split(".")[-2]
#name = name.split("/")[-1]
#name = name.split("_")[0..1]
#puts "Name:#{name[0]} #{name[1]}"
#puts "Problem: #{problem}"
puts "#{is_ok}"
