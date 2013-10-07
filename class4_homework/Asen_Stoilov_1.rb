require "csv"
name=[]
names=[]
CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |row|
next if row[0].to_s.length ==1
 name = row[1].to_s<< " " << row[2].to_s
 
 names<<[row[3],name,0,0]
 end

CSV.foreach(File.join(ARGV[0],"results1.csv")) do |row|

    imena = row[0].split("_")[0..1]
        enime = imena[0].to_s + " " + imena[1].to_s
if names.has_key?(enime) and row[2] == "true"
names[enime][1] = 1
elsif names.has_key?(enime) and row[2] == "false"
names[enime][1] = 0
end
end

CSV.foreach(File.join(ARGV[0],"results3.csv")) do |row|

    imena = row[0].split("_")[0..1]
        enime = imena[0].to_s + " " + imena[1].to_s
if names.has_key?(enime) and row[2] == "true"
names[enime][1] = 1
elsif names.has_key?(enime) and row[2] == "false"
names[enime][1] = 0
end
end

names = names.sort { |a,b| a[1][0] <=> b[1][0] }

CSV.open( 'results1.csv', 'wb' ) do |c|
names.each { |s| c << s[1] }
end
