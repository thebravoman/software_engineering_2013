require 'csv'
require 'date'

bgimena = {}
CSV.foreach(File.join(ARGV[0], "Evaluation 2013-2014 - Sheet2.csv")) do |row|
next if row[0].to_s.length != 1 and row[0].to_s.length != 2
namebg = row[1].to_s.strip + ' ' + row[2].to_s.strip
if row[3].nil?
enime = bgime
else
enime = row[3].to_s
end
filen1 = "#{enime.tr(' ', '_')}_1.rb"
filen3 = "#{enime.tr(' ', '_')}_3.rb"
bgimena[enime] = [bgime, fen1, fen3]
end
srok = DateTime.parse('2013-09-30T16:00:00+03:00')
bgimena.each do |n,m|
comand1 = `git log --date=iso --format="format:%cd" -- "../class2_homework/#{b[1]}"`
comand2 = `git log --date=iso --format="format:%cd" -- "../class2_homework/#{b[2]}"`
if comand1.empty?
m[1] = 0
else
m[1] = DateTime.parse( comand1.lines.first.chomp )
end
if comand2.empty?
m[2] = 0
else
m[2] = DateTime.parse( comand2.lines.first.chomp )
end
end

bgimena = bgimena.sort { |n,m| n[1][0] <=> m[1][0] }
CSV.open("results2.csv", "w") do |csv|
bgimena.each do |n,m|
begin
if m[1] <= srok and m[2] <= srok
csv << [m[0], m[1..2].max, "1"]
else
csv << [m[0], m[1..2].max, "0"]
end
rescue
if m[1] == 0 || b[2] == 0
help = 0
elsif m[1] != 0
help = m[1]
else
help = m[2]
end
csv << [m[0], help, "0"]
end
end
end
