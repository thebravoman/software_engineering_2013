require 'csv'

dir = '../class7_homework/'
b = ['', '.', '..', subfile]
all = '\A'
a = 0
subs = ARGV[0].nil? ? '../preyear3/28.srt' : ARGV[0]
subfile = File.basename( subs )
sub = [nil, nil, ""]
endsub = [nil,[0,-3000],""]
File.foreach( subs ) do |l|
        if a == 2 && l.strip!.empty?
                if sub[1][0] - endsub[1][1] < 3000
                        endsub[2] << ' ?' << sub[2]
                        endsub[1][1] = sub[1][1]
                else
                        all << endsub[2] << '[\n\r]+' unless endsub[2].empty?
                        endsub = sub
                end
                a = 0
                sub = [nil, nil, ""]
        end
        next if l.empty?
        if a == 0
                sub[0] = l.to_i
                a = 1
        elsif a == 1
                sub[1] = l.scan( /(\d\d):(\d\d):(\d\d),(\d\d\d)/ ).each { |time| time.collect! { |x| x.to_i } }.map! {
                                |i| i[0] * 3600000 + i[1] * 60000 + i[2] * 1000 + i[3] }
                a = 2
        else
                sub[2] << ' ?' unless sub[2].empty?
                sub[2] << Regexp.escape( l )
        end
        
end
if a == 2
        if sub[1][0] - endsub[1][1] < 3000
                endsub[2] << ' ?' << sub[2]
                all << endsub[2] << '[\n\r]+'
        else
                all << endsub[2] << '[\n\r]+' unless endsub[2].empty?
                all << sub[2] << '[\n\r]+' unless sub[2].empty?
        end
end
all[-1] = '*'
all << '\z'
all = Regexp.new( all )

Dir.mkdir( 'test_execution' ) unless Dir.exists?( 'test_execution' )

CSV.open( 'results1.csv', 'wb' ) do |csv|
        Dir.chdir( 'test_execution' )
        dir = '../' + dir
        subs = '../' + subs
        Dir.open( dir ).reject { |f| f =~ /^test_.*/ }.grep( /^[A-Za-z]+_[A-Za-z]+(_1)?\.rb$/ ) do |file|
                b[0] = file
                result = false
                name = file.gsub( /(_1)?\.rb/, '' ).tr( '_', ' ' )
                begin
                        `rm -rf *`
                        `cp #{subs} ./`
                        `cp #{File.join( dir, file )} ./`
                        data = `ruby #{file} #{subfile} 2> /dev/null`
                        if $?.exitstatus != 0
                                data = "Interpretation error"
                        else
                                if data.empty?
                                        data = File.read( Dir.open( '.' ).reject { |f| b.include?( f ) }.first )
                                end
                                result = true if data =~ all
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
