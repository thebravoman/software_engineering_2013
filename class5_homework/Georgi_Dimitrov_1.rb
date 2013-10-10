require 'date'
require 'csv'
names = Hash.new

CSV.foreach(File.join(ARGV[0], "Evaluation 2013-2014 - Sheet2.csv")) do |row|
	if row[0].to_s.lenght !=1 and row[0].to_s.lenght !=2
	bgname = row[1].to_s.strip + '' + row[2].to_s.strip
	end
	if row[3].nil?
		engname = bgname
	else
		engname = row[3].to_s
	end
	hw1 = "#{engname.tr(' ', '_')}_1.rb"
	hw3 = "#{engname.tr(' ', '_')}_3.rb"
	names[engname] = [bgname, hw1, hw3]
end

date = DateTime.parse('2013-09-30T16:00:00+03:00')

names.each do |x|
	homework1 = DateTime.parse(`git log --date=iso --format="format:%cd" -- #{x[1]}`).lines.first.chomp
	homework2 = DateTime.parse(`git log --date=iso --format="format:%cd" -- #{x}[2]`).lines.first.chomp
	if homework1.nil?
		x[1] = 0
	else
		x[1] = DateTime.parse(homework1.lines.first.chomp)
	end

	if homework2.nil?
		x[1] = 0
	else
		x[2] = DateTime.parse(homework2.lines.first.chomp)
	end
end

CSV.open("results2.csv", "w") do |csv|
	names.each do |x,y|
		if x[1] <= date and x[2] <= date
			csv << [x[0], x[1,2], "1"]
		else 
			csv << [x[0], x[1,2], "0"]
		end
	end
end