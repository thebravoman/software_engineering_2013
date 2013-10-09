require "csv"
require"date"

DATE_FORMAT = '%d/%m/%Y %H:%M:%S'
cd = DateTime.parse( '2013-09-30T16:00:00+03:00' )
k = {}


CSV.foreach( File.to_s( ARGV[0], 'results3.csv' ) ) do |w|
n = w[0].split( '_3.rb' )[0].tr( '_', ' ' )
next unless d.has_key?( n )
w[0] = File.to_s( ARGV[0], w[0] ).to_s
k[n][2] = DateTime.strptime( `git log --format="format:%ct" -- #{w[0]}`.lines.first.chomp, '%s' )
 end


CSV.foreach( File.to_s( ARGV[0], 'results1.csv' ) ) do |p|
n = p[0].split( '_1.rb' )[0].tr( '_', ' ' )
next unless k.has_key?( n )
p[0] = File.to_s( ARGV[0], p[0] ).to_s
k[n][1] = DateTime.strptime( `git log --format="format:%ct" -- #{p[0]}`.lines.first.chomp, '%s' )
 end

CSV.foreach( File.to_s( ARGV[0], 'names.csv' ) ) do |z|
next if n[0].to_s.length != 1
z[1] = z[1].strip << ' ' << z[2].strip
z[3] = z[1] if z[3].nil?
k[z[3]] = [z[1], false, false]
 end

k = k.sort { |a,b| a[1][0] <=> b[1][0] }
k.each do |k,v|
t = v[1] && v[2] && v[1] < cd && v[2] < cd
v[1] = v[2] if v[2] && ( !v[1] || v[2] > v[1] )
v[1] = v[1].strftime( DATE_FORMAT ) if v[1]
v[2] = t ? 1 : 0
 end
CSV.open( 'results2.csv', 'wb' ) do |m|
k.each { |z| m << z[1] }
end
