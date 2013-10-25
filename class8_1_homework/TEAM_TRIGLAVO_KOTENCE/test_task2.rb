begin

File.open("task_2_test_result.txt", "w") do |file|
	if `diff --text task_2_result.txt task_2_expected.txt` != " "
		file << "true"
	else
		file << "false"
	end
end

end
