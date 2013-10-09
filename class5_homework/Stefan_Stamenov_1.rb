require 'date'
require 'csv'
require'time'

h={}
DATE_FORMAT = '%d/%m/%Y %H:%M:%S'
dead_line=DateTime.parse( '2013-09-30T16:00:00+03:00' )
date_string=""

CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |row|
	  name=row[1].to_s+" "+row[2].to_s
		next if row[3].nil?
		next if row[3]=="Name English"
	  h[row[3]]=[name,0,0]
	end

Dir.glob(ARGV[0],"*_1.rb") do |file|

	names = "#{file}".to_s.split("_")[0..1]
	name = names[0].to_s + " " + names[1].to_s
	
	date_string1=`git log --format="format:%cd" -- #{file}`.lines.first.chomp
	date_string=date_string1
	if h.has_key?(name)
		h[name][1]=date_string
			if Date.parse(date_string)<=dead_line
			  h[name][2]=1
			end
	end
end


Dir.glob(ARGV[0],"*_3.rb") do |file|
	
	names = "#{file}".to_s.split("_")[0..1]
	name = names[0].to_s + " " + names[1].to_s

	date_string3=`git log --format="format:%cd" -- #{file}`.lines.first.chomp
		
	if h.has_key?(name)
			if Date.parse(date_string3)<=dead_line
				if Date.parse(date_string)<Date.parse(date_string3)
			       h[name][1]=date_string3
			     end
			  h[name][2]=1;
			  else h[name][2]=0
			end
	end
end


h = h.sort {|a,b| a[0] <=> b[0] }

CSV.open("results2.csv", "w") do |csv|
	h.each do |std|
	csv<<std[1]
	end
end
