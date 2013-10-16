subtitles = []
w_object = [0, 0]
to_read = false
subtitle_new = false
File.readlines(ARGV[0]).each do |line|
        if line =~ /\d{2}:[0-5]\d:[0-5]\d,\d{3} --> \d{2}:[0-5]\d:[0-5]\d,\d{3}/
                subtitle_new = true
                        s0 = line.split(" --> ")[0].split(/:|,/)
                        s1 = line.split(" --> ")[1].split(/:|,/)
                                tmp = s0[0].to_i*3600000 + s0[1].to_i*60000 + s0[2].to_i*1000 + s0[3].to_i
                                tm2 = s1[0].to_i*3600000 + s1[1].to_i*60000 + s1[2].to_i*1000 + s1[3].to_i
                                tmp - w_object[1] < 3000 ? to_read = true : to_read = false
                        w_object[0] = tmp
                        w_object[1] = tm2
                next                
        end
        
        subtitle_new = false if line =~ /^\s*$/
        
        if subtitle_new
                if !to_read
                        w_object[2] = line.chomp
                        subtitles <<  w_object.dup
                
                else

                        w_object[2] +=  ' ' + line.chomp
                        subtitles[subtitles.size-1] = w_object.dup
                end
        end
end

f = File.open('Stanislav_Beregov.txt', 'w')

        subtitles.each do |o|
                w_object = o
                f.write(w_object[2].to_s)
                f.write("\n") if !(o.equal? subtitles.last)
                f.write("\n")
end
        f.close