require 'csv'

CSV.open("Kiril_Kostadinov_test_data/result.csv", "w") do |csv|
	Dir.glob("*.rb") do |program|
		next if program[0..3] == test
		`mkdir test`
		`ruby #{program} Kiril_Kostadinov_test_data/28.srt Kiril_Kostadinov_test_data/out.txt`
		result = `diff Kiril_Kostadinov_test_data/out.txt Kiril_Kostadinov_test_data/Kiril_Kostadinov.txt`
		result.gsub!(/[\n\r]/, "")
		if result == ""
			csv << [file, result, true]
		else
			csv << [file, result, false]
		end
	end
end
