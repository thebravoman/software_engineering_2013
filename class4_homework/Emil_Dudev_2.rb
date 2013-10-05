#/usr/bin/ruby

require 'csv'
require 'date'

#DATE_FORMAT = '%a %b %-d %H:%M:%S %Y %z'
DATE_FORMAT = '%d/%m/%Y %H:%M:%S'
dl = DateTime.parse( '2013-09-30T16:00:00+03:00' )
d = {}
CSV.foreach( File.join( ARGV[0], 'names.csv' ) ) do |s|
	next if s[0].to_s.length != 1
	s[1] << ' ' << s[2]
	s[3] = s[1] if s[3].nil?
	d[s[3]] = [s[1], false, false]
end
CSV.foreach( File.join( ARGV[0], 'results1.csv' ) ) do |e|
	n = e[0].split( '_1.rb' )[0].gsub( /_/, ' ' )
	next unless d.has_key?( n )
	e[0] = File.join( ARGV[0], e[0] ).to_s
	d[n][1] = DateTime.strptime( `git log --format="format:%ct" -- #{e[0]}`.lines.first.chomp, '%s' )
end
CSV.foreach( File.join( ARGV[0], 'results3.csv' ) ) do |e|
	n = e[0].split( '_3.rb' )[0].gsub( /_/, ' ' )
	next unless d.has_key?( n )
	e[0] = File.join( ARGV[0], e[0] ).to_s
	d[n][2] = DateTime.strptime( `git log --format="format:%ct" -- #{e[0]}`.lines.first.chomp, '%s' )
end
d = d.sort { |a,b| a[0] <=> b[0] }
d.each do |k,v|
	t = v[1] && v[2] && v[1] < dl && v[2] < dl
	v[1] = v[2] if v[2] && ( !v[1] || v[2] > v[1] )
	v[1] = v[1].strftime( DATE_FORMAT ) if v[1]
	v[2] = t ? 1 : 0
end
CSV.open( 'results2.csv', 'wb' ) do |c|
	d.each { |s| c << s[1] }
end

