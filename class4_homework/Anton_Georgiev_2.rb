require 'csv'
require 'date'

all=[]
names=[]
DATE_FORMAT='%d/%m/%Y %H:%M:%S'
df=DateTime.parse('2013-09-30T16:00:00+03:00')

CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |row|
  next if row[0].to_s.length != 1
  row[1]=row[1].strip << ' ' << row[2].strip
  row[3]=row[1] if row[3].nil?
  names << [row[1],row[3]]
  all << [row[3], 0, 0]
end

CSV.foreach(File.join(ARGV[0],"results1.csv")) do |row|
  nams=row[0].split("_")[0..1]
  nam=nams[0] + " " + nams[1]
  all.each do |element|
    if element[0]==nam
      element[0]=File.join(ARGV[0],element[0] ).to_s
      element[1]=DateTime.strptime(`git log --format="format:%ct" -- #{element[0]}`.lines.first.chomp,'%s')
    end
  end
end

CSV.foreach(File.join(ARGV[0],"results3.csv")) do |row|
  nams=row[0].split("_")[0..1]
  nam=nams[0] + " " + nams[1]
  all.each do |element|
    if element[0]==nam
      element[0]=File.join( ARGV[0], element[0] ).to_s
      element[2]=DateTime.strptime(`git log --format="format:%ct" -- #{element[0]}`.lines.first.chomp,'%s')
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

all.each do |k,v|
  time = v[1] && v[2] && v[1] < df && v[2] < df
  v[1] = v[2] if v[2] && ( !v[1] || v[2] > v[1] )
  v[1] = v[1].strftime( DATE_FORMAT ) if v[1]
  v[2] = t ? 1 : 0
end

CSV.open("results2.csv", "w") do |csv|
  all.each do |element|
  csv << element
end
end
