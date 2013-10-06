require 'csv'

names = Hash.new(" ")
i = 1
CSV.foreach(File.join(ARGV[0], 'Evaluation 2013-2014 - Sheet2.csv')) do |row|
	if i <= 3
		i += 1
		next
	end
	if row[3] == nil
		row[3] = ' '
	end
	names[row[3]] = row[1].to_s + ' ' + row[2].to_s
end
task1 = Hash.new("0") 
CSV.foreach(File.join(ARGV[0], 'results1.csv')) do |row|
	name = row[0].split("_")
	eng_name = name[0].to_s + ' ' + name[1].to_s
	if row[2] == "true"
		task1[names[eng_name]] = '1'
	else
		task1[names[eng_name]] = '0'
	end
end
task3 = Hash.new("0")
CSV.foreach(File.join(ARGV[0], 'results3.csv')) do |row|
	name = row[0].split("_")
	eng_name = name[0].to_s + ' ' + name[1].to_s
	if row[2] == "true"
		task3[names[eng_name]] = '1'
	else
		task3[names[eng_name]] = '0'
	end
end
CSV.open("results1.csv", "w") do |csv|
	names.values.sort.each do |name|
		csv << [name,task1[name],task3[name]]
	end
end