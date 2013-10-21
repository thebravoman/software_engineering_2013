require "csv"
i = 0
a = ""
umri = 'test'
string = ""
names = []
broqch = 0
broqch2 = 0
File.open("sub_expected.txt", "r") do |file|
	while line = file.gets
		string = string + line
	end
	file.close
end
Dir["/home/petur/software_engineering_2013/class7_homework/*.rb"].each {|file|
	a = file.scan(/test/)
	a = a.to_s
	if a != umri
		result = `ruby #{file} sub.srt`
		result = result.to_s
		name = file.split("/").last
		name = name.split("_")[0..1]
		name[1] = name[1].split(".").first
		names[broqch] = name[0] + " " + name[1]
		if result == string
			names[broqch] = names[broqch] + "," + "1"
		else
			names[broqch] = names[broqch] + "," + result + "," + "0"
		end
		broqch += 1
	end
}
File.open("results1.csv", "w") do |file|
	while broqch2 <= broqch
		file.write(names[broqch2] + "\n")
		broqch2 += 1
	end
	file.close
end
