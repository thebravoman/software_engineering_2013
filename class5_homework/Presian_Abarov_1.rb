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

	p name, value
	filename = '../class2_homework/' + name.gsub(' ', '_')
	filenames = [filename+"_1.rb", filename+"_3.rb"]
	
	lastdate = DateTime.new()
	rescued = 0
	filenames.each do |fname|
		begin
			rescued = 0
			cmd = `git log #{fname}`
			lines = cmd.lines.to_a
			next if lines[1] =~ /fatal/
			date = DateTime.parse(lines[2].gsub("Date:","").strip)
			lastdate = lastdate < date ? date:lastdate
		rescue
			rescued = 1
		end
	end
	
	next if lastdate.nil?
	all[name][1] = lastdate
	next unless lastdate < deadline && rescued == 0
	all[name][2] = 1
	
end

all = all.sort_by { |name,value| name}

CSV.open("results2.csv","wb") do |csv|
	all.each do |key, value|
		csv << value
	end
end
