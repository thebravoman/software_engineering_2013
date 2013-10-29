require 'csv'

test = "1"
Dir.glob("*_2.rb") do |file|
	`ruby #{file} ./test2_data/bank.csv PAYPAL result_task_2.csv`
	test = `diff result_task_2.csv ./test2_data/expected_task_2.csv`
	
	if test == ""
		puts true
	else
		puts false
	end 	
	
end

`rm result_task_2.csv`
