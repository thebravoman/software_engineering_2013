require 'csv'

all = []

students = []

CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |row|
  next if row[0].to_s.length != 1
  row[1] = row[1].strip << ' ' << row[2].strip
  row[3] = row[1] 
  if row[3].nil?
  students << [row[1],row[3]]
  all << [row[3], 0, 0]
end

CSV.foreach(File.join(ARGV[0],"results1.csv")) do |row|
  first=row[0].split("_")[0..1]
  second=first[0] + " " + first[1]
  all.each do |element|
    if element[0]==second
      if row[2]=="true"
        element[1]=1
      else
        element[1]=0
      end
    end
  end
end

CSV.foreach(File.join(ARGV[0],"results3.csv")) do |row|
  first=row[0].split("_")[0..1]
  second=first[0] + " " + first[1]
  all.each do |element|
    if element[0]==second
      if row[2]=="true"
        element[2]=1
      else
        element[2]=0
      end
    end
  end
end

all.each do |element|
  students.each do |e|
    if element[0]==e[1]
      element[0]=e[0]
    end
  end
end

all = all.sort {|a,b| a[0] <=> b[0] }

CSV.open("results1.csv", "w") do |csv|
  all.each do |element|
  csv << element
end
end
