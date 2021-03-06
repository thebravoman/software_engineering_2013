is_ok = false 

	Dir.glob(ARGV[0]).each do |file|

		`mkdir test_execution`
		`cp #{file} test_execution`
		`cp people_task1_expected.csv test_execution`
		`cp people_input.csv test_execution`	

		Dir.chdir "test_execution"

		begin

			`ruby #{file} people_input.csv 79`
			result = system "diff people_task1_result.csv people_task1_expected.csv"

			if result		
				result1 = `diff people_task1_result.csv people_task1_expected.csv`
				is_ok = true if result1 == ""
			end

			puts is_ok

		rescue Exception => e
                        p e
		end

		Dir.chdir ".."
		`rm -rf test_execution`		

	end

