is_ok = true

	Dir.glob(ARGV[0]).each do |file|

		`mkdir test_execution`
		`cp #{file} test_execution`
		`cp people_task2_expected.csv test_execution`
		`cp people_input.csv test_execution`	

		Dir.chdir "test_execution"

		begin
			`ruby #{file} people_input.csv 1.75`
			result = system "diff people_task2_result.csv people_task2_expected.csv"

			if result				
				result1 = `diff people_task2_result.csv people_task2_expected.csv`
				is_ok = true if result1 == ""
			end

		puts is_ok

		rescue Exception => e
                        p e
		end

		Dir.chdir ".."
		`rm -rf test_execution`		

	end
