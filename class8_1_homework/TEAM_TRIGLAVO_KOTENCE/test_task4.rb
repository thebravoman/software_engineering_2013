File.open("result_test.txt" , "w") do |file|
	if `diff --text burza_zakusk.csv burza_zakusk_test.txt` != " "
		file << "true"
	else
		file << "false"
	end
end
