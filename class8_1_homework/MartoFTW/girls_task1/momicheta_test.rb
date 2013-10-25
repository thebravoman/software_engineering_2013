is_ok = false

	Dir.glob(ARGV[0]).each do |file|
	
		`mkdir test_execution`
		`cp #{file} test_execution`
		`cp momicheta_expected.csv test_execution`
		`cp girls.csv test_execution`
		
		Dir.chdir "test_execution"
		
		`ruby #{file} girls.csv Sama`
		result = system "diff momicheta_result.csv momicheta_expected.csv"
		
		if result
			result1 = `diff momicheta_result.csv momicheta_expected.csv`
			is_ok = true if result1 == ""
		end
		
		puts is_ok 
		
		Dir.chdir ".."
		`rm -rf test_execution`
	
	end
