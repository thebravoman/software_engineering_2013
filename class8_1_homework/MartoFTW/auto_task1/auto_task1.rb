require "csv"

m_name = ARGV[1]
arr_out = Array.new

	CSV.foreach(ARGV[0]) do |row|
		if row[1] == m_name
			arr_out << row
		end
	end

	arr_out.sort!{|a,b| a[2]<=>b[2]}

	CSV.open("auto_task1_result.csv","w") do |csv|
		arr_out.each do |elem|
			csv << elem
		end
	end

