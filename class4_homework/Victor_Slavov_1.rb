require 'pathname'
a = ARGV[0]
columns = ""
pn = Pathname.new("#{a}")
Dir.foreach("#{pn}") do |x|
	if x == "Evaluation 2013-2014 - Sheet2.csv"
		evaluation = File.open("#{x}", "r")
		information = evaluation.readlines
		length = information.length
		out_file = File.new("results1.csv", "w")
		i = 3
		information.sort
		while i < length do
			columns = information[i].split(',')
			out_file.puts("#{columns[17]},#{columns[11]},#{columns[12]}")
			i = i + 1;
		end
		break;
	end
end
