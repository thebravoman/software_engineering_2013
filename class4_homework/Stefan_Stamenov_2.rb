require 'csv'
require 'date'

DATE_FORMAT = '%d/%m/%Y %H:%M:%S'
deadline=DateTime.parse('2013-09-30T16:00:00+03:00')


h={}

CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |row|
	  name=row[1].to_s+" "+row[2].to_s
		next	if row[3].nil?
	  h[row[3]]=[name,false,false]
	end
end


CSV.foreach(File.join(ARGV[0],"results1.csv")) do |row|
	names = row[0].to_s.split("_")[0..1]
	name = names[0].to_s + " " + names[1].to_s
	if h.has_key?(name)
	  row[0] = File.join( ARGV[0],row[0] ).to_s
	  h[name][1] = DateTime.strptime( `git log --format="format:%ct" -- #{row[0]}`.lines.first.chomp, '%s' )
	end
end

CSV.foreach(File.join(ARGV[0],"results3.csv")) do |row|
	names = row[0].to_s.split("_")[0..1]
	name = names[0].to_s + " " + names[1].to_s
	if names.has_key?(name)
	  row[0] = File.join( ARGV[0],row[0] ).to_s
	  h[names][2] = DateTime.strptime( `git log --format="format:%ct" -- #{row[0]}`.lines.first.chomp, '%s' )
	end
end
h = h.sort { |a,b| a[1][0] <=> b[1][0] }
h.each do |k,v|
	t = v[1] && v[2] && v[1] < deadline && v[2] < deadline
	v[1] = v[2] if v[2] && ( !v[1] || v[2] > v[1] )
	v[1] = v[1].strftime( DATE_FORMAT ) if v[1]
	v[2] = t ? 1 : 0
end
CSV.open( 'results2.csv', 'wb' ) do |c|
	d.each { |s| c << s[1] }
end

