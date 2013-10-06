require 'csv'

h={}

CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |row|
	if row[0].to_s.length!=1
	  next
	else 
	  bgname=row[1].to_s+" "+row[2].to_s
		next	if row[3].nil?
	  h[row[3]]=[bgname,0,0]
	end
end


CSV.foreach(File.join(ARGV[0],"results1.csv")) do |row|
	names = row[0].to_s.split("_")[0..1]
	engname = names[0].to_s + " " + names[1].to_s
	if h.has_key?(engname)
	  h[name][1]=row [2]=='true' ? 1 : 0
	end
end

CSV.foreach(File.join(ARGV[0],"results3.csv")) do |row|
	names = row[0].to_s.split("_")[0..1]
	enname = names[0].to_s + " " + names[1].to_s
	if h.has_key?(enname)
	  h[name][2]=row [2]=='true' ? 1 : 0
	end
end

h = h.sort {|a,b| a[0] <=> b[0] }
puts h

CSV.open("results1.csv", "w") do |csv|
	h.each do |std|
	csv<<std[1]
	end
end
