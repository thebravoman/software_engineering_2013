output = true
	Dir.glob(ARGV[0]) do |file|

		`mkdir test_execution`
		`cp shop_task1_expected.csv test_execution`
		`cp #{file} test_execution`
		`cp shop_input.csv test_execution`

		Dir.chdir "test_execution"
		begin
			`ruby #{file} shop_input.csv meskomers`
			result = system "diff shop_task1_expected.csv shop_task1_result.csv"

			if result 
				result1 = `diff shop_task1_expected.csv shop_task1_result.csv`
				output = true if result1 == ""
			end
		
		puts output  

		rescue Exception => e
                        p e
		end

		Dir.chdir ".."
		`rm -rf test_execution`
	end
