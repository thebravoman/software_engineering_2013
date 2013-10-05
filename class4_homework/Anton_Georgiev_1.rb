require 'csv'

all = []

names = []

CSV.foreach(File.join(ARGV[0],"names.csv")) do |row|
  names << [row[0],row[1]]
  all << [row[1], 0, 0]
end

CSV.foreach(File.join(ARGV[0],"results1.csv")) do |row|
  nams=row[0].split("_")[0..1]
  nam=nams[0] + " " + nams[1]
  all.each do |element|
    if element[0]==nam
      if row[2]=="true"
        element[1]=1
      else
        element[1]=0
      end
    end
  end
end

CSV.foreach(File.join(ARGV[0],"results3.csv")) do |row|
  nams=row[0].split("_")[0..1]
  nam=nams[0] + " " + nams[1]
  all.each do |element|
    if element[0]==nam
      if row[2]=="true"
        element[2]=1
      else
        element[2]=0
      end
    end
  end
end

all.each do |element|
  names.each do |e|
    if element[0]==e[1]
      element[0]=e[0]
    end
  end
end

all = all.sort {|a,b| a[0] <=> b[0] }

CSV.open("results.csv", "w") do |csv|
  all.each do |element|
  csv << element
end
end
