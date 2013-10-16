subs = []

sub = []

firstdate = true

cattext = false

newsub = false

def parse_time(time,line)
	array = time.split(" --> ")[line].split(/:|,/)
	return array[0].to_i*3600000 + array[1].to_i*60000 + array[2].to_i*1000 + array[3].to_i
end



File.readlines(ARGV[0]).each do |line|

        if line =~ /\d{2}:[0-5]\d:[0-5]\d,\d{3} --> \d{2}:[0-5]\d:[0-5]\d,\d{3}/

                newsub = true

                t1 = parse_time(line,0)

                t2 = parse_time(line,1)

                if firstdate

                        firstdate = false

                        cattext = false

                        sub[0] = t1

                        sub[1] = t2

                else

                        if t1 - sub[1] < 3000

                                cattext = true

                        else

                                cattext = false

                        end

                end

                sub[0] = t1

                sub[1] = t2

                next                

        end

        if line =~ /^\s*$/

                newsub = false

        end

        if newsub

                if !cattext

                        sub[2] = line.chomp

                        subs <<  sub.dup

                else

                        sub[2] +=  ' ' + line.chomp

                        subs[subs.size-1] = sub.dup

                end

        end

end

f = File.open('Ivaylo_Markov.txt', 'w')

subs.each do |o|

        f.write(o[2])

        f.write("\n\n")

end

f.close
