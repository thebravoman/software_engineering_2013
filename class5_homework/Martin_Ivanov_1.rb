require "csv"
require "date"
require "time"

	names = Hash.new("")

	end_date = DateTime.parse( 'Mon Sep 30 16:00:00 2013 +0300' )

	CSV.foreach(ARGV[0]+"Evaluation 2013-2014 - Sheet2.csv") do |row|

		if row[0].to_s.length != 1
			next
		end

		name = row[1].to_s.strip + " " + row[2].to_s.strip

		if row[3].to_s != 0
			names[row[3]] = [name,0,0,0,0]
		else
			row[3] = name
			names[row[3]] = [name,0,0,0,0]
		end

	end

	Dir.glob(ARGV[0]+"*_1.rb").each do |file|
		
		result = `git log #{file}`
		lines = result.lines.to_a
		date = DateTime.parse(lines[2].gsub("Date :","").strip)
		#puts date
		#dates format tested, there is no problems with it 		
	
		two_names = file.split("_")[0..1]
		key = two_names[0] + " " + two_names[1]
		
		if names.has_key?(key)
			names[key][1] = date
		end

	end

	Dir.glob(ARGV[0]+"*_3.rb").each do |file|
		
		result = `git log #{file}`
		lines = result.lines.to_a
		date = DateTime.parse(lines[2].gsub("Date :","").strip)
		#puts date
		#dates format tested, there is no problems with it 		
	
		two_names = file.split("_")[0..1]
		key = two_names[0] + " " + two_names[1]
		
		if names.has_key?(key)
			names[key][2] = date
		end

	end

	names.each do |k,v| 
		
		if (v[1]>=end_date) || (v[2]>=end_date)
			v[3] = "0"
		else
			v[3] = "1"
		end	

		if v[1] > v[2] 
			v[4] = v[1]	
		else
			v[4] = v[2]
		end
		
	end

	CSV.open("results2.csv","w") do |csv|

		names.each do |k,v|
			csv << [names[k][0],names[k][4],names[k][3]] 
		end

	end
