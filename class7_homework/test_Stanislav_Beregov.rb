subs = []
obj = [0, 0]
cattext = false
newsub = false
File.readlines(ARGV[0]).each do |line|
        if line =~ /\d{2}:[0-5]\d:[0-5]\d,\d{3} --> \d{2}:[0-5]\d:[0-5]\d,\d{3}/
		newsub = true
		s0 = line.split(" --> ")[0].split(/:|,/)
                s1 = line.split(" --> ")[1].split(/:|,/)
                tmp = s0[0].to_i*3600000 + s0[1].to_i*60000 + s0[2].to_i*1000 + s0[3].to_i
                tm2 = s1[0].to_i*3600000 + s1[1].to_i*60000 + s1[2].to_i*1000 + s1[3].to_i
                tmp - obj[1] < 3000 ? cattext = true : cattext = false
		obj[0] = tmp
                obj[1] = tm2
                next                
        end
	newsub = false if line =~ /^\s*$/
        if newsub
                if !cattext
                        obj[2] = line.chomp
                        subs <<  obj.dup
                else
                        obj[2] +=  ' ' + line.chomp
                        subs[subs.size-1] = obj.dup
                end
        end
end
inpwords = []
yesflag = true
File.readlines(ARGV[1]).each do |line|
	inpwords << line.split(' ')[0] if !(line =~ /^\s*$/)
end
yesflag = false if inpwords.size != subs.size
inpwords.zip(subs).each { |i,s| yesflag = false if i != s[2].split(' ')[0] }
puts yesflag
