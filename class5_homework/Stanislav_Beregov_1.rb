require 'csv'
require 'date'
names = Hash.new{["", false, true]}
val = ["", false, true]
def parse_name(file_name)
	names = file_name.split("_")[0..1]
	return "" if names[0] == nil
	name = names[0] + " " + names[1]
end
CSV.foreach("#{ARGV[0]}/Evaluation 2013-2014 - Sheet2.csv") do |line|
	next if line[3] == nil
	next if line[3].empty?
	next if line[3] == "Name English"
	val[0] = line[1] << " " << line[2]
	names[line[3].encode('utf-8')] = val.dup
end
CSV.foreach("#{ARGV[0]}/results1.csv") do |line|
	name = parse_name(line[0])
	next if !names.has_key?(name)
	val = names[name]
	d1  =  DateTime.strptime( `git log --format="format:%ct" -- #{ARGV[0]}/#{line[0]}`.lines.first.chomp, '%s' )
	val[1] = d1
	val[2] = false if d1 > DateTime.parse( '2013-09-30T16:00:00+03:00' )
	names[name] = val
end
CSV.foreach("#{ARGV[0]}/results3.csv") do |line|
	name = parse_name(line[0])
	next if !names.has_key?(name)
	val = names[name]
	d1  =  DateTime.strptime( `git log --format="format:%ct" -- #{ARGV[0]}/#{line[0]}`.lines.first.chomp, '%s' )
	val[1] = d1 if d1 > val[1]
	val[2] = false if d1 > DateTime.parse( '2013-09-30T16:00:00+03:00' )
	names[name] = val
end
f = CSV.open( 'results2.csv', 'wb' )
names.each do |key, value|
	f << [value[0]] + [value[1].strftime('%d/%m/%Y %H:%M:%S')] + [value[2]]
end
f.close