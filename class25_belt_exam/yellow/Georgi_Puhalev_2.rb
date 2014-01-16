require 'csv'

file_name = ARGV[0]
clas = ARGV[1].to_s
a = Hash.new(0)
co = 0

CSV.foreach(file_name) do |row|
	use1 = row[1].split("/")[0]
	if row[1].split("/")[1] != nil
		use2 = row[1].split("/")[1]
	end
	name = row[0].split("_")[1].to_s
	price = row[3].to_i 
	if use1.to_s != clas
		if use2 != nil && use2.to_s != clas
				a[name] = price
		end
	end
end

a = a.sort_by{|a|a[1]}.reverse

file_name = file_name.split('.csv')

CSV.open("#{file_name[0]}_result.csv", "wb") do |f|
        a.each do |x|
              f << x
        end
end
