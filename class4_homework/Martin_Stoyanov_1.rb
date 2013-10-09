require 'csv'

all=Hash.new

CSV.foreach(File.join(ARGV[0] + "Evaluation 2013-2014 - Sheet2.csv")) do |row|
	#next if row[0].to_s.length == 1
	bg=row[1].to_s + '' + row[2].to_s   
	if row[3].nil?
		eng = bg
	else
		eng= row[3].to_s
	end
	all[eng] = [bg, 0 ,0]
end

CSV.foreach(File.join(ARGV[0] + "results1.csv")) do |row|
	names = row[0].split("_")[0..1]
	name = names[0].to_s + " " + names[1].to_s
	next if all.has_key?(name) == false
	all[name][1] = row[2] == 'true' ? 1:0
end

CSV.foreach(File.join(ARGV[0] + "results3.csv")) do |row|
	names = row[0].split("_")[0..1]
	name = names[0].to_s + " " + names[1].to_s
	next if all.has_key?(name) == false
	all[name][2] = row[2] == 'true' ? 1:0
end

all = all.sort_by { |key,value| } #T_T

CSV.open("resultss.csv","wb") do |csv|
	all.each do |name|
		csv << name[1]
	end
end