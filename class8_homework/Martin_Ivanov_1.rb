require "csv"
	
input = ARGV[0] # The SRT file which the program must parse
output = ARGV[1] # The parsed result
expected_result = ARGV[2] # The expected result

	def test_prog(filename,inp,out,expected)	
		# I assume that the input and the output are given from the command line 
		File.open(filename,"r").each do |line|
			if (line =~ /"w"/) || (line =~ /"wb"/) || (line =~ /'wb'/) || (line =~ /'w'/)
				arr_line = line.split(",")[0]
				arr_line_f = arr_line.split("(")[-1]
				if arr_line_f != "ARGV[1]"
					out = arr_line_f.gsub!(/'/," ")
					out.strip!
				end
			end
		end
		p out
		`ruby #{filename} #{inp} #{out}`
		return result = "error" if !(File.exist?(out))
		result = `diff #{out} #{expected}`
		`rm #{out}`
		return result 
	end


	def check_content(filename)		
			File.open("#{filename}", "r").each do |line|
				return false if line =~ /`/
			end
		return true
	end

	def make_name(name)
		name_arr = name.split("/")[-1]
		name_arr.gsub!(/.rb/,"")
		name_arrr = name_arr.split("_")[0..1]
		final_name = name_arrr[0] + " " + name_arrr[1]
	end

	`mkdir programs`
	`cp #{input} programs`
	`cp #{expected_result} programs`

	Dir.glob("*.rb") do |file|
		if check_content(file)
			`cp #{file} programs`
			p file 
		end
	end

	output_arr = []

	Dir.glob(File.join("programs/","*.rb")) do |file|
		test_result = test_prog(file,input,output,expected_result)
		eng_name = make_name(file)

		if test_result == ""			
			output_arr << [eng_name,test_result,1]
		else
			if test_result == "error"
				output_arr << [eng_name,"",0]
			else	
				output_arr << [eng_name,test_result,0]
			end
		end
	end

	`rm -rf programs`

	CSV.open("result1.csv","wb") do |csv|
		output_arr.each do |elem|
			csv << elem
		end
	end
