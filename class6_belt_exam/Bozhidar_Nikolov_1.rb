require 'csv'

debit_lines = Array.new
input_file = ARGV[0]
searched_value = ARGV[1]
i = 0
CSV.foreach(input_file) do |row|
	if row =~ searched_value	
		debit_lines[i] << row
		i += 1
	end
end

debit_lines.sort_by { |a, b, c, d, e, f| c }

CSV.open("#{input_file}_result.csv", "w") do |csv|
	debit_lines.each do |line|
		csv << [line]
	end
end
