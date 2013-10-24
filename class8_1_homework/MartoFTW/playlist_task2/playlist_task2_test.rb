is_ok = false

	Dir.glob(ARGV[0]).each do |file|
	
		`mkdir test_execution`
		`cp playlist_task2_expected.csv test_execution`
		`cp #{file} test_execution`
		`cp playlist_input.csv test_execution`
		Dir.chdir "test_execution"
		
		begin
			`ruby #{file} playlist_input.csv Azis`
			result = system "diff playlist_task2_expected.csv playlist_task2_result.csv"
		
			if result
				result1 = `diff playlist_task2_expected.csv playlist_task2_result.csv`
				is_ok = true if result1 == ""
			end

			puts is_ok

		rescue Exception => e
                        p e
		end	

		Dir.chdir ".."
		`rm -rf test_execution`
	
	end
