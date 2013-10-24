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
programs_arguments_file = "programs_arguments.txt"
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
        if (program[0].strip == file_name.split(".")[0].split("_")[-1])
                program_info = program[1]
        end
end
output_file = program_info.split("->")[1].strip
expected_file = program_info.split("->")[2].strip
`mkdir program`
`cp #{file_name} program/test.rb`
`ruby program/test.rb #{program_info.split("->")[0]}`
if(!File.file?(output_file))
        File.open("test.rb","r").each do |row|
                if (row =~ /#{program_info.split("->")[1]}/)
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
                strip_file(expected_file,"second_"+expected_file)
                problem = `diff #{output_file} #{"second_"+expected_file}`
                if (problem == "")
                        problem = "Diff problem:syntax error";
                else
                        problem = "diff problem:unknow";
                end               
                `rm -f #{"second_"+expected_file}`
        end
end
`rm -f program -r`
puts "Name:#{file_name.split("_")[0]} #{file_name.split("_")[1]}"
puts "Problem: #{problem}"
puts "#{is_ok}"
