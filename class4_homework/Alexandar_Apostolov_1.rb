require 'csv'

def parse_name file_name
		names = file_name.split("_")[0..1]
		names[0] + " " + names[1]
end

name_tr = {}
res1 = {}
res3 = {}
unnamed = 0
first_line = 1;

CSV.foreach("Evaluation 2013-2014 - Sheet2.csv") do |row|
	if first_line == 0
		if row[3].to_s.length > 0
			name_tr[row[3]] = row[4]
		else
			unnamed = unnamed + 1
		end
	else
		first_line = 0;
	end
end

CSV.foreach("results1.csv") do |row|
	if row[2] == 'true'
		res1[parse_name(row[0])] = 1
	elsif row[2] == 'false'
		res1[parse_name(row[0])] = 0
	end
end

CSV.foreach("results3.csv") do |row|
	if row[2] == 'true'
		res3[parse_name(row[0])] = 1
	elsif row[2] == 'false'
		res3[parse_name(row[0])] = 0
	end
end

CSV.open("results2.csv", "w") do |csv|
	name_tr.each do |row|
		csv << [row[1], res1[row[0]], res3[row[0]]]
	end
	i = 2
	while i < unnamed do
		csv << ["Pedal"]
		i += 1
	end
end
=begin
	
	File.join(ARGV[0] + )

=end
