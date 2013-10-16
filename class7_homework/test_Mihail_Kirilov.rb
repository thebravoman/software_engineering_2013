require 'csv'

CSV.open("Mihail_Kirilov_test_data/results.csv", "w") do |csv|
	Dir.glob("*.rb") do |file|
		begin
			`mkdir test_execution`
			`cp #{file} test_execution`
			`cd test_execution && ruby #{file} Mihail_Kirilov_test_data/37.srt ../Mihail_Kirilov_test_data/`
			result = `diff test_execution/parsed_subtitles.txt Mihail_Kirilov_test_data/parsed_subs_expected.txt`
			result = result.gsub(/[\n\r]/,"")
			`rm test_execution/*`
			csv << [file,result == ""]
		rescue
			result = "Exception for #{file}"
			csv << [file, result, false]
		end
	end
end
