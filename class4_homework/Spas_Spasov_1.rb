require 'csv'
n={}

CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |r|
	  bgime=row[1].to_s+" "+row[2].to_s
	  next if r[3].nil?
	  r[3]=bgime if r[3].nill?	
	  n[r[3]]=[bgime,0,0]
	end
end

CSV.foreach(File.join(ARGV[0],"results1.csv")) do |r|
        imena = r[0].split("_")[0..1]
        enime = imena[0].to_s + " " + imena[1].to_s
	if n.has_key?(enime) and r[2] == "true"
		n[enime][1] = 1
	elsif n.has_key?(enime) and r[2] == "false"
		n[enime][1] = 0
	end
end

CSV.foreach(File.join(ARGV[0],"results3.csv")) do |r|
	imena = r[0].to_s.split("_")[0..1]
	enime = imena[0].to_s + " " + imena[1].to_s
	if n.has_key?(enime)
	  n[name][2] = r[2]== "true" ? 1 : 0
	end
end	

n = n.sort_by { |a, b| a }

CSV.open( 'results1.csv', 'w' ) do |csv|
	n.each do |a, b|
		csv << b
	end
end
