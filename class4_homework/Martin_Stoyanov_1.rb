
require 'csv'

all=Hash.new

CSV.foreach(File.join(ARGV[0] + "Evaluation 2013-2014 - Sheet2.csv")) do |row|
	next if row[0].to_s.length != 1
	next if row[3].nil?
	all[row[3]] = [row[1] + " " + row[2]]
end

CSV.foreach(File.join(ARGV[0] + "results1.csv")) do |row|
	names = row[0].split("_")[0..1]
	name = names[0].to_s + " " + names[1].to_s
	next if all.has_key?(name) == false
	all[name] << result = row[2] == "true"? 1:0	
end

CSV.foreach(File.join(ARGV[0] + "results3.csv")) do |row|
	names = row[0].split("_")[0..1]
	name = names[0].to_s + " " + names[1].to_s
	next if all.has_key?(name) == false
	all[name] << result = row[2] == "true"? 1:0	
end

all = all.sort_by { |key,value| key }

CSV.open("results1.csv","w") do |csv|
	all.each do |key,value|
		csv << value
	end
end