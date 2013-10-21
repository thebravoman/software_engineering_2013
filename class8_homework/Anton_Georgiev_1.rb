require 'csv'
require 'time'

	if File.directory?("testing_folder")
		`rm -f testing_folder/ -r`
	end
	if File.exist?("results1.csv")
		`rm -f results1.csv`
	end
	`mkdir testing_folder`
	Dir.chdir("../preyear3")
	`cp 28.srt ../class8_homework/testing_folder`
	Dir.chdir("../class8_homework/testing_folder")
	sub_check = String.new
	sub_control=String.new
	second_time=Time.parse("20:20:20")
	j = 0
	i = 0

	File.open("28.srt").each do |line|
        	if line =~ /-->/
                	first_time=Time.parse(line.split(" --> ")[0])
                	if second_time - first_time>=3 && j!=0
                        	sub_control="\n"
                	else
                        	sub_control=String.new
                	end
                	second_time=Time.parse(line.split(" --> ")[1])
                	j=1
                	i=0
        	elsif i==1
                	sub_check += line + sub_control
        	end
        	i+=1
	end
	Dir.chdir("..")

	CSV.open("results1.csv","w") do |csv|
		Dir.chdir("../class7_homework")
		Dir.glob("*.rb") do |file|
			if file.split("_")[0]!="test"
				`cp #{file} ../class8_homework/testing_folder`
				Dir.chdir("../class8_homework/testing_folder")
				`ruby #{file} 28.srt`
				names=file.split("_")[0..1]
				name=names[0] + " " + names[1]
				if File.exist?("28_result.txt")
					File.open("28_result.txt") do |file_home|
						sub_to_check=file_home.read
						csv << [name,sub_to_check==sub_check ? '' : sub_to_check,sub_to_check==sub_check ? 1 : 0]
					end
				end
			end
			`rm -f #{file}`
			`rm -f 28_result.txt`
			Dir.chdir("..")
		end
	end
	`rm -f testing_folder/28.srt`
	`rm -f testing_folder/ -r`
