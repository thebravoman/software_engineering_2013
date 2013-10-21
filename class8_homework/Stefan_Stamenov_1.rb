require 'csv'

inputdir = '../class7_homework/'
srtpath = ARGV[0].nil? ? '../preyear3/28.srt' : ARGV[0]
srtfile = File.basename( srtpath )
banned = ['', '.', '..', srtfile]

bigreg = '\A'
type = 0
sub = [nil, nil, ""]
lastsub = [nil,[0,-3000],""]
File.foreach( srtpath ) do |l|
	if type == 2 && l.strip!.empty?
		if sub[1][0] - lastsub[1][1] < 3000
			lastsub[2] << ' ?' << sub[2]
			lastsub[1][1] = sub[1][1]
		else
			bigreg << lastsub[2] << '[\n\r]+' unless lastsub[2].empty?
			lastsub = sub
		end
		type = 0
		sub = [nil, nil, ""]
	end
	next if l.empty?
	if type == 0
		sub[0] = l.to_i
		type = 1
	elsif type == 1
		sub[1] = l.scan( /(\d\d):(\d\d):(\d\d),(\d\d\d)/ ).each { |time| time.collect! { |x| x.to_i } }.map! {
				|i| i[0] * 3600000 + i[1] * 60000 + i[2] * 1000 + i[3] }
		type = 2
	else
		sub[2] << ' ?' unless sub[2].empty?
		sub[2] << Regexp.escape( l )
	end
	
end
if type == 2
	if sub[1][0] - lastsub[1][1] < 3000
		lastsub[2] << ' ?' << sub[2]
		bigreg << lastsub[2] << '[\n\r]+'
	else
		bigreg << lastsub[2] << '[\n\r]+' unless lastsub[2].empty?
		bigreg << sub[2] << '[\n\r]+' unless sub[2].empty?
	end
end
bigreg[-1] = '*'
bigreg << '\z'
bigreg = Regexp.new( bigreg )

Dir.mkdir( 'test_execution' ) unless Dir.exists?( 'test_execution' )

CSV.open( 'results1.csv', 'wb' ) do |csv|
	Dir.chdir( 'test_execution' )
	inputdir = '../' + inputdir
	srtpath = '../' + srtpath
	Dir.open( inputdir ).reject { |f| f =~ /^test_.*/ }.grep( /^[A-Za-z]+_[A-Za-z]+(_1)?\.rb$/ ) do |file|
		banned[0] = file
		result = false
		name = file.gsub( /(_1)?\.rb/, '' ).tr( '_', ' ' )
		begin
			`rm -rf *`
			`cp #{srtpath} ./`
			`cp #{File.join( inputdir, file )} ./`
			data = `ruby #{file} #{srtfile} 2> /dev/null`
			if $?.exitstatus != 0
				data = "Interpretation error"
			else
				if data.empty?
					data = File.read( Dir.open( '.' ).reject { |f| banned.include?( f ) }.first )
				end
				result = true if data =~ bigreg
			end
		rescue
			data = "Exception"
		end
		csv << [name, result ? '' : data, result ? 1 : 0]
	end
	`rm -rf *`
	Dir.chdir( '..' )
end
Dir.rmdir( 'test_execution' )

