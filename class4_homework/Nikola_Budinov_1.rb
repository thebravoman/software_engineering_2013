require 'csv'

names=[]
all=[]

CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |row|
	next if row[0].to_s.length != 1
		row[1] = row[1].strip << ' ' << row[2].strip
		row[3] = row[1] if row[3].nil?
		names << [row[1],row[3]]
		all << [row[3],0,0]
	end

CSV.foreach(File.join(ARGV[0],"results1.csv")) do |row|
	nameove=row[0].split("_")[0..1]
	name=nameove[0] + " " + nameove[1]
	all.each do |el|
		if el[0]==name
			if row[2]=="true"
				el[1]=1
			else
				el[1]=0
			end
		end
	end
end

CSV.foreach(File.join(ARGV[0],"results3.csv")) do |row|
	nameove=row[0].split("_")[0..1]
	name=nameove[0] + " " + nameove[1]
	all.each do |e|
		if e[0]==name
			if row[2]=="true"
				e[2]=1
			else
				e[2]=0
			end
		end
	end
end

all.each do |e|
	names.each do |el|
		if e[0]==el[1]
			e[0]=el[0]
		end
	end
end

all = all.sort {|a,b| a[0] <=> b[0] }

CSV.open("results1.csv", "w") do |csv|
	all.each do |e|
		csv << e
	end
end
