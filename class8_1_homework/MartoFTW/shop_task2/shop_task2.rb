require "csv"
require "date"

our_date = Date.strptime(ARGV[1].to_s,'%d/%m/%Y')

arr_out = []

	CSV.foreach(ARGV[0]) do |row|

		if Date.strptime(row[3].to_s,'%d/%m/%Y') <= our_date

			arr_out << row		

		end

	end

	arr_out = arr_out.sort_by{|a,b,c,d| b}

	CSV.open("shop_task2_result.csv","w") do |csv|
		arr_out.each do |elem|
			csv << elem 
		end
	end
