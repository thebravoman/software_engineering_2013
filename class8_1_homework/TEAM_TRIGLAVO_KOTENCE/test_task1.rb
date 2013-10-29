require "csv"

begin

File.open("test_result.txt", "w") do |file|
	if `diff --text task_1_result_expected.txt  task_1_result.txt` != " "
		file << "true"
	else
		file << "false"
	end
end

end
