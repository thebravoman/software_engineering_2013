require 'csv'

all = []

names = []

CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |row|
  if row[0].to_s.length != 1 then
	next
	end
  #row[1] = row[1].strip << ' ' << row[2].strip
  row[1] = row[1].strip+row[2].strip
  #row[3] = row[1] if row[3].nil?
  if row[3].nil? then
  row[3] = row[1]
  end
  names << [row[1],row[3]]
  all << [row[3], 0, 0]
end

CSV.foreach(ARGV[0] + "results1.csv")) do |row|
  nams=row[0].split("_")[0..1]
  nam=nams[0] + " " + nams[1]
  all.each do |piece|
    if piece[0]==nam
      if row[2]=="true"
        piece[1]=1
    end
  end
end

CSV.foreach((ARGV[0] + "results3.csv")) do |row|
  nams=row[0].split("_")[0..1]
  nam=nams[0] + " " + nams[1]
  all.each do |piece|
    if piece[0]==nam
      if row[2]=="true"
        piece[2]=1
    end
  end
end

all.each do |piece|
  names.each do |p|
    if piece[0]==p[1]
      piece[0]=p[0]
    end
  end
end

all = all.sort {|a,b| a[0] <=> b[0] }

CSV.open("results1.csv", "w") do |csv|
  all.each do |piece|
  csv << piece
end
end
