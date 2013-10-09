require "csv"
require "date"

	names = Hash.new("")

	eND_dATE = DateTime.parse( '2013-09-30T16:00:00+03:00' )

	CSV.foreach(ARGV[0] + "/evaluation.csv") do |row|
		
		if row[0].to_s.length != 1 
			next
		else 
			name = row[1].to_s+" "+row[2].to_s
			names[row[3]] = [name,0,0]
		end

	end

	CSV.foreach(ARGV[0] + "/results1.csv") do |row|

		tmp = row[0].split("_")[0..1]
		name = tmp[0]+" "+tmp[1]
		
		if names.has_key?(name)
			key = ""
			key = File.join(ARGV[0],row[0]).to_s
			names[name][2] = DateTime.strptime( `git log --format="format:%ct" -- #{key}`.lines.first.chomp, '%s' )

		end

	end
	
	CSV.foreach(ARGV[0] + "/results3.csv") do |row|

		tmp = row[0].split("_")[0..1]
		name = tmp[0]+" "+tmp[1]
		
		if names.has_key?(name)
			key = ""
			key = File.join(ARGV[0],row[0]).to_s
			names[name][2] = DateTime.strptime( `git log --format="format:%ct" -- #{key}`.lines.first.chomp, '%s' )

		end

	end

	CSV.open("results2.csv","w") do |csv|	

		names.each do |a,b|

			if (names[1] <= eND_dATE) && (names[2] <= eND_dATE)
				csv << names[names[0],names[1..2].max,"1"]	
			else
				csv << names[names[0],names[1..2].max,"0"]
			end 

		end

	end
