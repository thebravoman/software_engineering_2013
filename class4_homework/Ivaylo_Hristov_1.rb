# encoding: utf-8
require 'csv'
namesbg = {}

CSV.foreach(File.join(ARGV[0], "Evaluation 2013-2014 - Sheet2.csv")) do |row|
	next if row[0].to_s != 'A' and row[0].to_s.length != 2
	namebg = row[1].to_s.strip + ' ' + row[2].to_s.strip
	if row[3].nil?
		nameen = namebg
	else 
		nameen = row[3].to_s
	end
	namesbg[nameen] = [namebg, 0, 0]
end

CSV.foreach(File.join(ARGV[0], "results1.csv")) do |row|
	name = row[0].split('_1.rb')[0].tr('_',' ')
	next if namesbg.has_key?(name) == false
	namesbg[name][1] = row[2] == 'true' ? 1 : 0
end

CSV.foreach(File.join(ARGV[0], "results3.csv")) do |row|
	name = row[0].split('_3.rb')[0].tr('_',' ')
	next if namesbg.has_key?(name) == false
	namesbg[name][2] = row[2] == 'true' ? 1 : 0
end

namesbg = namesbg.sort { |a,b| a[1][0] <=> b[1][0] }
CSV.open("results1.csv", "w") do |csv|
	namesbg.each { |name| csv << name[1] }
end