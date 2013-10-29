
result = "1"
Dir.glob("*_4.rb") do |file|
	`ruby #{file} ./test4_data/champs.csv 6300 result.csv`
	result = `diff result.csv ./test4_data/expected_task_4.csv`		
	name_fam = file.split("_")[0..1]
	name = name_fam[0] + " " + name_fam[1]
		
	if result == ""
		 puts true
	else		
		 puts false	
	end
end


`rm result.csv`
