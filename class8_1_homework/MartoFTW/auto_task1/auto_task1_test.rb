
output = false 
	Dir.glob(ARGV[0]) do |file|

		`mkdir test_execution`
		`cp auto_task1_expected.csv test_execution`
		`cp #{file} test_execution`
		`cp auto_input.csv test_execution`

		Dir.chdir "test_execution"

		begin

			`ruby #{file} auto_input.csv Renault`
			result = system "diff auto_task1_expected.csv auto_task1_result.csv"

			if result
				result1 = `diff auto_task1_expected.csv auto_task1_result.csv`
				
				output = true if result1 == ""
			end
		
			puts output  
	
		rescue Exception => e
                        p e
		end	

		Dir.chdir ".."
		`rm -rf test_execution`
	end
