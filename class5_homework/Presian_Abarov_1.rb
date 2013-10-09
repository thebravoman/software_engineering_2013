#!/usr/bin/ruby

require 'csv'
require 'date'

all = {}
deadline = DateTime.parse( '2013-09-30T16:00:00+03:00' )


CSV.foreach("../class4_homework/test_data/Evaluation 2013-2014 - Sheet2.csv") do |row|
	next if row[0].to_s.length != 1
	next if row[3].nil?
	all[row[3]] = [row[1] + " " + row[2], 0, 0]
end

all.each do |name, value|
	filename = '../class2_homework/' + name.gsub(' ', '_')
	filenames = [filename+"_1.rb", filename+"_3.rb"]
	
	lastdate = DateTime.new()
	hasAllFiles = 1
	filenames.each do |fname|
		begin
			cmd = `git log #{fname}`
			lines = cmd.lines.to_a
			date = DateTime.parse(lines[2].gsub("Date:","").strip)
			lastdate = lastdate < date ? date:lastdate
		rescue
			hasAllFiles = 0
		end
	end
	
	next if lastdate.nil?
	all[name][1] = lastdate
	next unless lastdate < deadline && hasAllFiles == 1
	all[name][2] = 1
	
end

all = all.sort_by { |name,value| name}

CSV.open("results2.csv","wb") do |csv|
	all.each do |key, value|
		csv << value
	end
end
