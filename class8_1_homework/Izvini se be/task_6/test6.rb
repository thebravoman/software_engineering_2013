

result1 = "1"
result2 = "2"
result3 = "3"

Dir.glob("*_6.rb") do |file|
	name_fam = file.split("_")[0..1]
	name = name_fam[0] + " " + name_fam[1]
	`ruby #{file} ./test6_data/champs.csv output1.csv Mage`
	result1 = `diff output1.csv ./test6_data/expexted_task6_output1.csv`
	result1 = result1.gsub(/\n\r/, "")
	`rm output1.csv`			
	
	`ruby #{file} ./test6_data/champs.csv output2.csv Tank Mage`
	result2 = `diff output2.csv ./test6_data/expexted_task6_output2.csv`
	result2 = result2.gsub(/\n\r/, "")
	`rm output2.csv`

	`ruby #{file} ./test6_data/champs.csv output3.csv Mage Tank`
	result3 = `diff output3.csv ./test6_data/expexted_task6_output3.csv`
	result3 = result3.gsub(/\n\r/, "")
	`rm output3.csv`
	
	if (result1 == "") && (result2 == "") && (result3 == "")
		puts true
	else
		puts false
	end
	
end
