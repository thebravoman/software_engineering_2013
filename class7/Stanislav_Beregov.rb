subs = []
obj = []
firstdate = true
cattext = false
newsub = false
File.readlines(ARGV[0]).each do |line|
	if line =~ /\d{2}:[0-5]\d:[0-5]\d,\d{3} --> \d{2}:[0-5]\d:[0-5]\d,\d{3}/
		newsub = true
		if firstdate
			firstdate = false
			s0 = line.split(" --> ")[0].split(/:|,/)
			s1 = line.split(" --> ")[1].split(/:|,/)
			obj[0] = s0[0].to_i*3600000 + s0[1].to_i*60000 + s0[2].to_i*1000 + s0[3].to_i
			obj[1] = s1[0].to_i*3600000 + s1[1].to_i*60000 + s1[2].to_i*1000 + s1[3].to_i
			cattext = false
		else
			s0 = line.split(" --> ")[0].split(/:|,/)
			s1 = line.split(" --> ")[1].split(/:|,/)
			tmp = s0[0].to_i*3600000 + s0[1].to_i*60000 + s0[2].to_i*1000 + s0[3].to_i
			tm2 = s1[0].to_i*3600000 + s1[1].to_i*60000 + s1[2].to_i*1000 + s1[3].to_i
			if tm2 <= obj[0]+300000

				cattext = true
			else
				obj[0] = tmp
				obj[1] = tm2
				cattext = false
			end
		end
		next		
	end
	if line =~ /^\s*$/
		newsub = false
	end
	if newsub
		if !cattext
			obj[2] = line.split.join(' ')
			subs <<  obj.dup
		else
			obj[2] += line.split.join(' ')
			subs[subs.size-1] = obj.dup
		end
	end
end
f = File.open('Stanislav_Beregov.txt', 'w')
subs.each do |o|
	obj = o
	f.write(obj[2].to_s)
	f.write("\n")
	f.write("\n")
end
f.close
