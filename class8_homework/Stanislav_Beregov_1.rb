require 'fileutils'
require 'csv'
obj = [0, 0]
def DATTEST(sbs, testpath)
	inpwords = []
	File.readlines(testpath).each do |line|
        	inpwords << line.chomp.split(" ").reduce(:+)  if !(line =~ /^\s*$/) && !line.empty?
	end
	return false if inpwords.size != sbs.size
	inpwords.zip(sbs).each {|i,s| return false if i != s[2]}
	return true
end
subs = []
cattext = false
newsub = false
File.readlines("../preyear3/28.srt").each do |line|
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
                        obj[2] = line.chomp.split(" ").reduce(:+)
                        subs <<  obj.dup
                else
                        obj[2] +=  line.chomp.split(" ").reduce(:+)
                        subs[subs.size-1] = obj.dup
                end
        end
	cattext = true #dat fix
end
students = {}
FileUtils.mkdir "Stanislav_Beregov_test_dir"
FileUtils.chdir("Stanislav_Beregov_test_dir")
names = Dir["../../class7_homework/*.rb"].reject{|n| File.basename(n) =~ /^test_.*/}
names.each do |name|
	FileUtils.cp(name, ".")
	`ruby #{File.basename(name)} ../../preyear3/28.srt > testoutput.out` 
	outpfiles = Dir["./*"].reject{|n| (File.basename(n) == File.basename(name)) }
	flag = false
	fname = ""
	maxsize = 0
	outpfiles.each do |file|
		if maxsize <= File.size(File.basename(file))
			maxsize = File.size(File.basename(file))
			fname = File.basename(file)
		end
		flag = true if DATTEST(subs, file)
	end
	reg = []
	reg[0] = flag
	reg[1] = File.readlines(fname)
	students[File.basename(name, ".rb").split("_")[0] + " " + File.basename(name, ".rb").split("_")[1]] = reg.dup
	FileUtils.rmtree "."
end
FileUtils.chdir("..")
FileUtils.rmtree "Stanislav_Beregov_test_dir"
f = CSV.open("results1.csv", "wb")
students.each do |student, result|
	f << [student, result[0] ? '' : String(result[1].reduce(:+)), result[0] ? 1 : 0]
end
f.close