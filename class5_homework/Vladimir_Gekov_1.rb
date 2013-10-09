require 'csv'
require 'date'

bgnames = {}
CSV.foreach( File.join(ARGV[0], "Evaluation 2013-2014 - Sheet2.csv")) do |row|
next if row[0].to_s.length != 1 and row[0].to_s.length != 2
namebg = row[1].to_s.strip + ' ' + row[2].to_s.strip
if row[3].nil?
engnames = namebg
else
engnames = row[3].to_s
end
f01 = "#{engnames.tr(' ', '_')}_1.rb"
f03 = "#{engnames.tr(' ', '_')}_3.rb"
bgnames[engnames] = [namebg, f01, f03]
end
deadline = DateTime.parse('2013-09-30T16:00:00+03:00')
bgnames.each do |a,b|
cmd1 = `git log --date=iso --format="format:%cd" -- "../class2_homework/#{b[1]}"`
cmd2 = `git log --date=iso --format="format:%cd" -- "../class2_homework/#{b[2]}"`
if cmd1.empty?
b[1] = 0
else
b[1] = DateTime.parse( cmd1.lines.first.chomp )
end
if cmd2.empty?
b[2] = 0
else
b[2] = DateTime.parse( cmd2.lines.first.chomp )
end
end

bgnames = bgnames.sort { |a,b| a[1][0] <=> b[1][0] }
CSV.open("results2.csv", "w") do |csv|
bgnames.each do |a,b|
begin
if b[1] <= deadline and b[2] <= deadline
csv << [b[0], b[1..2].max, "1"]
else
csv << [b[0], b[1..2].max, "0"]
end
rescue
if b[1] == 0 || b[2] == 0
res = 0
elsif b[1] != 0
res = b[1]
else
res = b[2]
end
csv << [b[0], res, "0"]
end
end
end
