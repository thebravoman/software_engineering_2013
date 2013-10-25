File.open("result_test.txt" , "w") do |file|
	if `diff --text result.csv result2.txt` != " "
		file << "true"
	else
		file << "false"
	end
end
